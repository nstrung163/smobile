var table;
var url = '/admin/purchase-details';
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
			{ data: 'purchaseId' },
			{ data: 'purchaseDetailId' },
			{ render: function(data, type, row) {
					return `<div class='text-center image-area-brand'><a href="/${row.imageUrl}" data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src="/${row.imageUrl}"></div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<td>${row.productName} ${row.colorProductName} ${row.memoryProduct} GB</td>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class="unit-price"> ${currencyFormat(row.salePrice)} ₫</div>`;
				} 
			},
			{ data: 'quantity' },
			{ render: function(data, type, row) {
					return `<div class="sale-date"> ${getFormattedDate(row.dateOfOrder)}</div>`;
				} 
			},
			{ data: 'fullName' },
			{ data: 'purchaseStatusName' },
			{
				render: function(data, type, row) {
					return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.purchaseDetailId}" data-name="${row.productName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> | 
							<a class="delete-btn" data-id="${row.purchaseDetailId}" data-name="${row.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
				}
			}
		],
	});
}).fail(function() {
	alert("Lỗi khi lấy dữ liệu từ hệ thống!");
})
}

$(document).ready(function() {
	initTableData();
	/** Show modal form update purchase detail */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('.modal-title').text('Chỉnh Sửa Hóa Đơn');
		$('#btnSubmitPurchaseDetail').text('Cập nhật');
		$.ajax({
			url: '/admin/purchase-detail/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				console.log(`Giá trị của responseData: ${JSON.stringify(responseData)}`)
				resetFormModal($('#purchaseDetailInfoForm'));
				$("#purchaseId").val(responseData[0].purchaseId);
				$("#purchaseDetailId").val(responseData[0].purchaseDetailId);
				$("#productName").val(responseData[0].productName + ' ' + responseData[0].colorProductName + ' ' + responseData[0].memoryProduct + ' GB' );
				$("#salePrice").val(responseData[0].salePrice);
				$("#quantity").val(responseData[0].quantity);
				$("#dateOfOrder").val(responseData[0].dateOfOrder);
				$("#purchaseStatusName").val(responseData[0].purchaseStatusName);
				$("#fullName").val(responseData[0].fullName);
				$("#description").val(responseData[0].description);
				var imageUrl =  '/' + responseData[0].imageUrl;
				if(imageUrl == null || imageUrl == "") {
					imageUrl = '/images/image-demo.png';
				}
				$("#logoImg img").attr('src', imageUrl)
				$("#logo").val(imageUrl);
			}
		})
	})

	/** Submit Update Purchase Detail */
	$("#btnSubmitPurchaseDetail").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($('#purchaseDetailInfoForm')[0]);
		$("#purchaseDetailInfoForm").validate({
			rules: {
				purchaseStatusName: {
					required: true
				}
			},
			messages: {
				purchaseStatusName: {
					required: "Trạng thái đơn hàng không được để trống!",
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#purchaseDetailInfoForm").valid()) {
			$.ajax({
				url: '/admin/purchase-detail/update',
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

	/** Show modal delete purchase detail */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deletePurchaseDetailId").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})
	

	/** Submit delete purchase detail */
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/admin/purchase-detail/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				reloadDataTable();
				$('#confirmDeleteModal').modal('toggle');
				$('#announcemnet strong:eq(0)').removeClass("text-warning").addClass("text-success");
				$('#notification').text("Xóa đơn hàng thành công!");
				$("#announcemnet").toast('show');
			},
			error: function(e) {
				console.log('error: ' + $(this).data('id'))
				alert('Xóa đơn hàng không thành công: ' + JSON.stringify(e));
			}
		})
	})
})

function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}
