var table;
var url = '/products';
function initTableData() {
	/** Data from an URL */
	$.get(url, function(responseData) {
		table = $('#dataTable').DataTable({
			orderCellsTop: true,
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
						$('input[name=saleDate]').val(today);
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

	/** Show modal form update product */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#productId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Nhãn Hiệu');
		$('#btnSubmitProduct').text('Cập nhật');
		$.ajax({
			url: '/product/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#productInfoForm'));
				console.log('responseData: ' + JSON.stringify(responseData))
				$("#productId").val(responseData.productId);
				$("#productName").val(responseData.productName);
				$("#unitPrice").val(responseData.unitPrice);
				$("#quantity").val(responseData.quantity);
				$("#saleDate").val(responseData.saleDate);
				$("#statusProduct").val(responseData.statusProduct);
				$("#brandId").val(responseData.brandEntity.brandId);
				if($("#statusProduct").val() == "Hết hàng") {
					$("#quantity").val(0);
					$('input[name=quantity]').attr('readonly', 'readonly');
				} else {
					$('input[name=quantity]').removeAttr('readonly');
				}
			}
		})
	})
	
	$('#statusProduct').on('change', function() {
		if(this.value != "Hết hàng" || this.value == "") {
			$('input[name=quantity]').removeAttr('readonly');
		} else {
			$('input[name=quantity]').attr('readonly', 'readonly');
		}
	})

	/** Submit Update Product */
	$("#btnSubmitProduct").on('click', function(event) {
		event.preventDefault();
		
		var $productId = $('#productId');
		var isAddAction = $productId.val() == undefined || $productId.val() == "";
		var isHasQuantity =  $("#statusProduct").val() == "Còn hàng";
		
		console.log('isHasQuantity: ' + isHasQuantity);
		console.log('isAddAction: ' + isAddAction);
		$("#productInfoForm").validate({
			rules: {
				productName: {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				unitPrice: {
					required: true,
					minlength: 1
				},
				quantity: {
					required: true,
					maxlength: 32767
				},
				saleDate: {
					required: true
				},
				statusProduct: {
					required: true
				},
				brandId: {
					required: true
				}
			},
			messages: {
				productName: {
					required: "Tên sản phẩm không được để trống!",
					minlength: "Tên sản phẩm phải có ít nhất 2 ký tự!",
					maxlength: "Tên sản phẩm không vượt quá 100 ký tự!"
				},
				unitPrice: {
					required: "Đơn giá không được để trống!",
					minlength: "Đơn giá không được bé hơn 1"
				},
				quantity: {
					required: "Số lượng không được để trống!",
					maxlength: "Số lượng thêm vào không vượt quá 32767"
				},
				saleDate: {
					required: "Ngày bán sản phẩm không được để trống!"
				},
				statusProduct: {
					required: "Trạng thái sản phẩm không được để trống!"
				},
				brandId: {
					required: "Nhãn hiệu sản phẩm không được để trống!"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#productInfoForm").valid()) {
			var formData = new FormData($('#productInfoForm')[0]);
			if($('#statusProduct').val() == "Hết hàng") {
				$('#quantity').val(0)
				$('input[name=quantity]').removeAttr('readonly');
			} else {
				$('input[name=quantity]').attr('readonly', 'readonly');
			}
			$.ajax({
				url: '/product/' + (isAddAction ? "add" : "update"),
				type: isAddAction ? 'POST' : 'PUT',
				processData: false,
				contentType: false,
				data: formData,
				success: function(responseData) {
					console.log(responseData);
					if (responseData.responseCode == 100) {
						/**Reload datatable */
						reloadDataTable();
						$('#myModal').modal('toggle');
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
					alert('Cập nhật sản phẩm không thành công! ' + JSON.stringify(e));
				}
			})
		}

	})

	/** Show modal delete product */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteProductName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})
	
	/** Submit delete product*/
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/product/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				console.log('responseCode: ' + responseData.responseCode);
				if(responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					$('#announcemnet strong:eq(0)').removeClass("text-warning").addClass("text-success");
					$('#notification').text(responseData.responseMsg);
					$("#announcemnet").toast('show');
				} else  { 
					$('#announcemnet strong:eq(0)').removeClass("text-success").addClass("text-warning");
					$('#notification').text(responseData.resposneMsg);
					$("#announcemnet").toast('show');
				}
			},
			error: function(e) {
				alert('Xóa sản phẩm thành công không thành công: ' + JSON.stringify(e));
			}
		})
	})
})

/**
*
* Reload datatable
* 
* @return new datatable
*/
function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}

/**
*
* Get current date
*
* @return current date
*/
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();
if(dd < 10) {
	dd = '0' + dd;
}
if(mm < 10) { 
	mm = '0' + mm;
}
today = yyyy + '-' + mm + '-' + dd;

