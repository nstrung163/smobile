$(document).ready(function() {

	findAllBrands(1);
	/*Pagination on lick + search brand name*/
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr("data-index");
		var brandName = $('#keyword').val();
		if (brandName != "") {
			searchBrandName(brandName, pageNumber);
		} else {
			findAllBrands(pageNumber);
		}
	})

	var $brandInfoForm = $('#brandInfoForm')
	var $brandInfoModal = $('#brandInfoModal')

	/* Search brand */
	$('#searchBrand').on('click', function() {
		var brandName = $('#keyword').val();
		searchBrandName(brandName, 1);
	})

	/* Rest form*/
	$('#restPage').on('click', function() {
		$('#keyword').val("");
		$('#resultSearch p').empty();
		findAllBrands(1);
	})

	/* Show form add new brand */
	$("#addBrandInfoModal").on('click', function() {
		resetFormModal($brandInfoForm);
		showModalWithCustomizedTitle($brandInfoModal, "Add New Brand");
		$('#logoImg img').attr('src', '/images/image-demo.png');
		$('#brandId').closest(".form-group").addClass("d-none");
	});

	/* Show form update modal */
	$("#brandInfoTable").on('click', '.edit-btn', function() {
		$("#brandLogo .required-field").addClass("d-none");
		$.ajax({
			url: "/brand/api/find?id=" + $(this).data("id"),
			type: 'GET',
			dateType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					var brandInfo = responseData.data;
					resetFormModal($brandInfoForm);
					showModalWithCustomizedTitle($brandInfoModal, "Edit Brand");

					$('#brandId').val(brandInfo.brandId);
					$('#brandName').val(brandInfo.brandName);
					$('#description').val(brandInfo.description);

					var brandLogo = brandInfo.logo;
					if (brandLogo == null || brandLogo == "") {
						brandLogo = "/images/image-demo.png";
					}
					$("#logoImg img").attr("src", brandLogo);
					$("#logo").val(brandLogo);
					$('#brandId').closest(".form-group").removeClass("d-none");
				}
			}
		})
	});

	/* Show modal confirm delete brand */
	$("#brandInfoTable").on('click', '.delete-btn', function() {
		$("#deletedBrandName").text($(this).data("name"));
		$("#deleteSubmitBtn").attr("data-id", $(this).data("id"));
		$('#confirmDeleteModal').modal('show');
	});
	
	/* Submit form deleted brand */
	$("#deleteSubmitBtn").on('click', function() {
		$.ajax({
			url: "/brand/api/delete/" + $(this).attr("data-id"),
			type: 'DELETE',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				$('#confirmDeleteModal').modal('hide');
				showNotification(responseData.responseCode == 100, responseData.responseMsg);
				findAllBrands(1);
			}
		});
	});

	/* Submit add new brand */
	$("#saveBrandBtn").on('click', function(event) {

		event.preventDefault();
		var formData = new FormData($brandInfoForm[0]);
		var brandId = formData.get("brandId");
		var isAddAction = brandId == undefined || brandId == "";

		$brandInfoForm.validate({
			ignore: [],
			rules: {
				brandName: {
					required: true,
					minlength: 2,
					maxlength: 100,
				},
				logoFiles: {
					required: isAddAction,
				}
			},
			messages: {
				brandName: {
					required: "Brand name is required",
					minlength: "Your brand name must consist of at least 2 characters",
					maxlength: "Your brand name must less than 100 characters"
				},
				logoFiles: {
					required: "Brand logo is required"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});

		if ($brandInfoForm.valid()) {
			$.ajax({
				url: "/brand/api/" + (isAddAction ? "add" : "update"),
				type: 'POST',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				timeout: 10000,
				data: formData,
				success: function(responseData) {
					if (responseData.responseCode == 100) {
						$brandInfoModal.modal('hide');
						findAllBrands(1);
						showNotification(true, responseData.responseMsg);
					} else {
						showMsgOnField($brandInfoForm.find("#brandName"), responseData.responseMsg);
					}
				}
			});
		}
	})
});

/**
	Find brands list with page
	@param pageNumber
 */
function findAllBrands(pageNumber) {
	$.ajax({
		url: "/brand/api/findAll/" + pageNumber,
		type: 'GET',
		dataType: 'json',
		contentType: 'application/json',
		success: function(responseData) {
			if (responseData.responseCode == 100) {
				renderBrandsTable(responseData.data.brandsList);
				renderPagination(responseData.data.paginationList);
				if ($('.pagination').removeClass("d-none")) {
					$('#resultSearch p').empty();
				}
			}
		}
	});
}

function searchBrandName(brandName, pageNumber) {
	$.ajax({
		url: "/brand/api/search/" + brandName + "/" + pageNumber,
		type: 'GET',
		dataType: 'json',
		contentType: 'application/json',
		success: function(responseData) {
			if (responseData.responseCode == 100) {
				renderBrandsTable(responseData.data.brandsList);
				renderPagination(responseData.data.paginationList);
				if (responseData.data.paginationList.pageNumberList.length < 2) {
					$('.pagination').addClass("d-none");
				} else {
					$('.pagination').removeClass("d-none");
				}
				renderMessageSearch(responseData.responseMsg);
			}
		}
	});
}

/*Render jsp for brand table */
function renderBrandsTable(brandsList) {

	var rowHtml = "";
	$("#brandInfoTable tbody").empty();
	$.each(brandsList, function(key, value) {
		rowHtml = "<tr class='text-center'>"
			+ "<td class='no'>" + value.brandId + "</td>"
			+ "<td class='brand-name'>" + value.brandName + "</td>"
			+ "<td class='text-center'><a href='" + value.logo + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='" + value.logo + "'></td>"
			+ "<td class='description'>" + value.description + "</td>"
			+ "<td class='action-btns'>"
			+ "<a class='edit-btn' data-id='" + value.brandId + "'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" + value.brandName + "' data-id='" + value.brandId + "'><i class='fas fa-trash-alt'></i></a>"
			+ "</td>"
			+ "</tr>";
		$("#brandInfoTable tbody").append(rowHtml);
	});
}
function renderMessageSearch(responseMsg) {
	$('#resultSearch p').empty();
	$('#resultSearch p').append(responseMsg);
}
/*Pagination*/
function renderPagination(paginationList) {

	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.firstPage + '" > Fisrt page </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > Previous </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > Next </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.lastPage + '" > Last page </a></li>'
		$("ul.pagination").append(paginationInnerHtml);

	}
}
