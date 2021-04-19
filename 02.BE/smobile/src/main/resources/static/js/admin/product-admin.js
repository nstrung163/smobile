var table;
var url = '/products';
function initTableData() {
	/** Data from an URL */
	$.get(url, function(responseData) {
		/*alert(`data=${JSON.stringify(responseData)}`)*/
		table = $('#dataTable').DataTable({
			orderCellsTop: true,
			fixedHeader: true,
			processing: true,
			data: responseData,
			columns: [
				{ data: 'productId' },
				{ data: 'productName' },
				{ render: function(data, type, row) {
					return `<div class="unit-price"> ${currencyFormat(row.unitPrice)} ₫</div>`;
				} },
				{ render: function(data, type, row) {
					return `<div class="quantity-product"> ${row.quantity}</div>`;
				} },
				{ render: function(data, type, row) {
					return `<div class="sale-date"> ${getFormattedDate(row.saleDate)}</div>`;
				} },
				{ data: 'statusProduct' },
				{ data: 'brandEntity.brandName' },
				{
					render: function(data, type, row) {
						return `<div class="action-btns text-center">
								<a class="edit-btn" data-id="${row.productId}" data-name="${row.productName}" data-toggle="modal" data-target="#myModal">
									<i class="icon-edit-btn fas fa-edit"></i>
								</a> | 
								<a class="delete-btn" data-id="${row.productId}" data-name="${row.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
									<i class="icon-delete-btn fas fa-trash-alt"></i>
								</a>
							</div>`;
					}
				}
			],
			dom: 'Bfrtip',
			buttons: [
				{
					text: 'Thêm Mới Sản Phẩm',
					action: function(e, dt, node, config) {
						resetFormModal($('#productInfoForm'));
						$('.modal-title').text('Thêm Mới Sản Phẩm');
						$('#btnSubmitProduct').text('Đồng ý');
						$('#productId').parent().addClass("d-none");
						$('#myModal').modal('toggle');
					}
				}
			]
		});
	}).fail(function() {
		alert("Lỗi khi lấy dữ liệu từ hệ thống! ");
	})
}

$(document).ready(function() {
	initTableData();
	/** Hover change background tag thead */
	$("#list-header").on({
		mouseenter: function() {
			$(this).css("background-color", "lightgray");
		},
		mouseleave: function() {
			$(this).css("background-color", "lightblue");
		}
	})

	/** Show modal form update brand */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#brandId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Nhãn Hiệu');
		$('#btnSubmitBrand').text('Cập nhật');
		$.ajax({
			url: '/product/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#brandInfoForm'));
				console.log('responseData: ' + JSON.stringify(responseData))
				$("#brandId").val(responseData.brandId);
				$("#brandName").val(responseData.brandName);
				$("#description").val(responseData.description);
				var brandLogo = responseData.logo;
				console.log(brandLogo)
				if(brandLogo == null || brandLogo == "") {
					brandLogo = '/images/image-demo.png';
				}
				
				$("#logoImg img").attr('src', brandLogo)
				$("#logo").val(brandLogo);
			}
		})
	})

	/** Submit Update Brand */
	$("#btnSubmitBrand").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($('#brandInfoForm')[0]);
		var $brandId = $('#brandId');
		var isAddAction = $brandId.val() == undefined || $brandId.val() == "";
		
		$("#brandInfoForm").validate({
			rules: {
				brandName: {
					required: true,
					minlength: 2,
					maxlength: 45,
				},
				logoFile: {
					required: isAddAction
				}
			},
			messages: {
				brandName: {
					required: "Tên nhãn hiệu không được để trống!",
					minlength: "Tên nhãn hiệu phải có ít nhất 2 ký tự!",
					maxlength: "Tên nhãn hiệu không vượt quá 45 ký tự!"
				},
				logoFile: {
					required: "Không được để trống hình ảnh nhãn hiệu!"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#brandInfoForm").valid()) {
			$.ajax({
				url: 'brand/' + (isAddAction ? "add" : "update"),
				type: 'POST',
				processData: false,
				contentType: false,
				enctype: 'multipart/form-data',
				data: formData,
				success: function(responseData) {
					console.log(responseData);
					if (responseData.responseCode == 100) {
						/**Reload datatable */
						reloadDataTable();
						$('#myModal').modal('toggle');
						/*$('.modal-backdrop').remove();*/
						$('#announcemnet strong:eq(0)').removeClass("text-warning").addClass("text-success");
						$('#notification').text(responseData.responseMsg);
						$("#announcemnet").toast('show');
					} else if(responseData.responseCode == 1 || responseData.responseCode == 0) {
						$('#announcemnet strong:eq(0)').removeClass("text-success").addClass("text-warning");
						$('#notification').text(responseData.responseMsg);
						$("#announcemnet").toast('show');
					}
				},
				error: function(e) {
					alert('Cập nhật nhãn hiệu không thành công! ' + JSON.stringify(e));
				}
			})
		}

	})

	/** Show modal delete brand */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteBrandName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})
	

	/** Submit delete brand */
	$("#btnSubmitDelete").on('click', function() {
		console.log('.data("") = ' + $(this).data('id') + ', .attr= ' + $(this).attr('data-id'));
		$.ajax({
			url: 'brand/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				reloadDataTable();
				$('#confirmDeleteModal').modal('toggle');
				$('#announcemnet strong:eq(0)').removeClass("text-warning").addClass("text-success");
				$('#notification').text("Xóa nhãn hiệu thành công!");
				$("#announcemnet").toast('show');
				console.log(responseData + ' success: ' + $(this).data('id'))
			},
			error: function(e) {
				console.log('error: ' + $(this).data('id'))
				alert('Xóa nhãn hiệu không thành công: ' + JSON.stringify(e));
			}
		})
		console.log('Brand id after:' + $(this).data('id'))
	})
})

function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}

