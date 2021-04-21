$(document).ready(function() {

	findAllProducts(1);

	/* Pagination*/
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr("data-index");
		var keyword = $('#keyword').val();
		var priceFrom = $('#priceFrom').val();
		var priceTo = $('#priceTo').val();
		if (keyword != "" || listBrandArr != "" || priceFrom != "" || priceTo != "") {
			searchProduct(pageNumber, true, listBrandArr);
		} else {
			findAllProducts(pageNumber);
		}
	});

	/* Reset page */
	$('#restPage').on('click', function() {
		$('#priceFrom').val("");
		$('#priceTo').val("");
		$('#keyword').val("");
		listBrandArr = [];
		$('input[type=checkbox]').each(function() {
			this.checked = false;
		})
		$('.list-brand__item').removeClass("li-enable");
		findAllProducts(1);
	})

	/* Border for tag "li" on click*/
	$('.check').change(function() {
		$(this).parent().toggleClass("li-enable");
	})

	/* Show more and hidden logo brand */
	var max = 13;
	$('ul, li').each(function() {
		$(this).find('li').each(function(index) {
			if (index >= max) {
				$(this).hide();
			}
		})
	})
	$('.hidden-item').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').addClass("d-none");
		$('.show-more').removeClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				if (index >= max) {
					$(this).hide();
				}
			})
		})
	})
	$('.show-more').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').removeClass("d-none");
		$('.show-more').addClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				$(this).show();
			})
		})
	})

	/*Get list brandId*/
	var listBrandArr = [];
	$('.check').on('click', function() {
		listBrandArr = [];
		$('.listBrand').find('input[name="brand.logo"]:checked').each(function() {
			listBrandArr.push($(this).val());
			//$('li').addClass("border border-primary");
			//$('input[type=checkbox], input[type=radio]').css("opacity", "1");
		});
		/*console.log(listBrandArr);
		$('#output ').html(listBrandArr.join('\xa0\xa0'));*/
	})

	/* Search product */
	$('#searchByPrice').on('click', function() {
		searchProduct(1, true, listBrandArr);
	});

	/*Search product by conditions*/
	function searchProduct(pageNumber, isClickedSearchBtn, listBrandArr) {
		var searchConditions = {
			keyword: $("#keyword").val(),
			priceFrom: $("#priceFrom").val(),
			priceTo: $("#priceTo").val(),
			listBrandId: listBrandArr
		}
		$.ajax({
			url: '/product/api/searchProduct/' + pageNumber,
			type: 'POST',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					renderProductsTable(responseData.data.productsList);
					renderPagination(responseData.data.paginationList);
					if (responseData.data.paginationList.pageNumberList.length < 2) {
						$('.pagination').addClass("d-none");
					} else {
						$('.pagination').removeClass("d-none");
					}
					renderMessageSearch(responseData.responseMsg);
				}
			},
			data: JSON.stringify(searchConditions)
		});
	}
	var $productInfoForm = $('#productInfoForm');
	var $productInfoModal = $('#productInfoModal');


	/* Set current day default for sale date*/
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd < 10) { dd = '0' + dd }
	if (mm < 10) { mm = '0' + mm }
	today = yyyy + '-' + mm + '-' + dd;
	/* Show form add new product*/
	$("#addProductInfoModal").on('click', function() {
		resetFormModal($productInfoForm);
		$('input[name=saleDate]').val(today);
		showModalWithCustomizedTitle($productInfoModal, "Add New Product");
		$('#logoImg img').attr('src', '/images/image-demo.png');
		$('#productId').closest(".form-group").addClass("d-none");
	});

	/*Show form update modal*/
	$("#productInfoTable").on('click', '.edit-btn', function() {
		$("#productImage .required-field").addClass("d-none");
		$.ajax({
			url: "/product/api/find?id=" + $(this).data("id"),
			type: 'GET',
			dateType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					var productInfo = responseData.data;
					resetFormModal($productInfoForm);
					showModalWithCustomizedTitle($productInfoModal, "Edit Product");

					$('#productId').val(productInfo.productId);
					$('#productName').val(productInfo.productName);
					$('#quantity').val(productInfo.quantity);
					$('#price').val(productInfo.price);
					$('#brandId').val(productInfo.brandEntity.brandId);
					$('#saleDate').val(productInfo.saleDate);
					$('#description').val(productInfo.description);

					var productImage = productInfo.image;
					if (productImage == null || productImage == "") {
						productImage = "/images/image-demo.png";
					}
					$("#logoImg img").attr("src", productImage);
					$("#image").val(productImage);
					$('#productId').closest(".form-group").removeClass("d-none");
				}
			}
		})
	});


	/*Submit add new product or update product*/
	$("#saveProductBtn").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($productInfoForm[0]);
		var productId = formData.get("productId");
		var isAddAction = productId == undefined || productId == "";
		$productInfoForm.validate({
			ignore: [],
			rules: {
				productName: {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				quantity: {
					required: true,
					number: true
				},
				price: {
					required: true,
					number: true,
				},
				brandName: {
					required: true
				},
				saleDate: {
					required: true
				},
				logoFiles: {
					required: isAddAction,
				}
			},
			messages: {
				productName: {
					required: "Product name is required",
					minlength: "Your product name must consist of at least 2 characters",
					maxlength: "Your product name must less than 100 characters"
				},
				quantity: {
					required: "Quantity is required",
					number: "Quantity is number"
				},
				price: {
					required: "Price is required",
					number: "Price is number"
				},
				brandName: {
					required: "Brand is required",
				},
				saleDate: {
					required: "Opening for date is required"
				},
				logoFiles: {
					required: "Image is required"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($productInfoForm.valid()) {

			$.ajax({
				url: "/product/api/" + (isAddAction ? "add" : "update"),
				type: 'POST',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				timeout: 10000,
				data: formData,
				success: function(responseData) {
					//Show message successffuly or failed
					if (responseData.responseCode == 100) {
						$productInfoModal.modal('hide');
						findAllProducts(1);
						showNotification(true, responseData.responseMsg);
					} else {
						showMsgOnField($productInfoForm.find("#productName"), responseData.responseMsg);
					}
				}
			});
		}
	})
});

/*Show modal confirm delete product*/
$("#productInfoTable").on('click', '.delete-btn', function() {
	$("#deletedProductName").text($(this).data("name"));
	$("#deleteSubmitBtn").attr("data-id", $(this).data("id"));
	$('#confirmDeleteModal').modal('show');
});

/*Submit form deleted product*/
$("#deleteSubmitBtn").on('click', function() {
	$.ajax({
		url: "/product/api/delete/" + $(this).attr("data-id"),
		type: 'DELETE',
		dataType: 'json',
		contentType: 'application/json',
		success: function(responseData) {
			$('#confirmDeleteModal').modal('hide');
			showNotification(responseData.responseCode == 100, responseData.responseMsg);
			findAllProducts(1);
		}
	});
});

/*
	List products with a page
	@param pageNumber
*/
function findAllProducts(pageNumber) {
	$.ajax({
		url: "/product/api/findAll/" + pageNumber,
		type: 'GET',
		dataType: 'json',
		contentType: 'application/json',
		success: function(responseData) {
			if (responseData.responseCode == 100) {
				renderProductsTable(responseData.data.productsList);
				renderPagination(responseData.data.paginationList);
				if ($('.pagination').removeClass("d-none")) {
					$('#resultSearch p').empty();
				}
			}
		}
	});
}

/* Currency format 
	@param price
	@return price format
*/
function currencyFormat(price) {
	return price.toLocaleString('vi-VN', { useGrouping: true });
}

/* Render jsp for product table*/
function renderProductsTable(productsList) {

	var rowHtml = "";
	$("#productInfoTable tbody").empty();
	$.each(productsList, function(key, value) {
		rowHtml = "<tr>"
			+ "<td class='no'>" + value.productId + "</td>"
			+ "<td>" + value.productName + "</td>"
			+ "<td class='quantity'>" + value.quantity + "</td>"
			+ "<td class='price-td'>" + currencyFormat(value.price) + "₫</td>"
			+ "<td class='brand-logo-td'>" + value.brandEntity.brandName + "</td>"
			+ "<td class='sale-date'>" + getFormattedDate(value.saleDate) + "</td>"
			+ "<td>" + value.description + "</td>"
			+ "<td class='text-center'><a href='" + value.image + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='" + value.image + "'></td>"
			+ "<td class='action-btns'>"
			+ "<a class='edit-btn' data-id='" + value.productId + "'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" + value.productName + "' data-id='" + value.productId + "'><i class='fas fa-trash-alt'></i></a>"
			+ "</td>"
		"</tr>";
		$("#productInfoTable tbody").append(rowHtml);
	})
}

/* Render result message search */
function renderMessageSearch(responseMsg) {
	$('#resultSearch p').empty();
	$('#resultSearch p').append(responseMsg);
}
/*function getCurrentDay(saleDate) {
	var saleDate = new Date();
	var month = (saleDate.getMonth() + 1);
	var day = saleDate.getDate();
	if (month < 10)
		month = "0" + month;
	if (day < 10)
		day = "0" + day;
	var today = day + + '-' + month + '-' + saleDate.getFullYear();
	return today;
}*/
/* Format Date*/
function getFormattedDate(saleDate) {
	var date = new Date(saleDate);
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	if (date < 10) { date = '0' + date }
	if (month < 10) { month = '0' + month }
	return day + '/' + month + '/' + year;
}
/*Pagination*/
function renderPagination(paginationList) {

	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.firstPage + '" > Fisrt  </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > Previous </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > Next </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.lastPage + '" > Last </a></li>'
		$("ul.pagination").append(paginationInnerHtml);

	}
}

