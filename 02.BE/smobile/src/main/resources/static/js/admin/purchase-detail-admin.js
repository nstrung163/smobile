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
		"order": [[ 1, 'desc' ]],
		"columnDefs": [ 
			{ className: "td-id", "targets": [ 0 ] },
			{ className: "td-product-name", "targets": [ 2 ] },
			{ className: "td-sale-price", "targets": [ 3 ] },
			{ className: "td-quantity", "targets": [ 4 ] },
			{ className: "td-sale-date", "targets": [ 5 ] },
			{ className: "td-full-name", "targets": [ 6 ] },
			{ className: "td-purchase-status-name", "targets": [ 7 ] },
			{ className: "td-action", "targets": [ 8 ] },
		  ],
		columns: [
			{ render: function(data, type, row) {
					return `<div class="purchase-id">${row.purchaseDetailId}</div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class='text-center image-area-brand'><a href="/${row.imageUrl}" data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src="/${row.imageUrl}"></div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<td>${row.productName} ${row.colorProductName} ${row.memoryProduct} GB</td>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class="sale-price"> ${currencyFormat(row.salePrice)} ₫</div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class="product-quantity"> ${row.quantity}</div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class="sale-date"> ${getFormattedDate(row.dateOfOrder)}</div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class="full-name"> ${row.fullName}</div>`;
				} 
			},
			{ render: function(data, type, row) {
					if(row.purchaseStatusName == "Hủy đơn hàng") {
						return `<div class="purchase-status-name cancel"> ${row.purchaseStatusName}</div>`;
					} else if(row.purchaseStatusName == "Đang giao hàng") {
						return `<div class="purchase-status-name sending"> ${row.purchaseStatusName}</div>`;
					} else if(row.purchaseStatusName == "Đã giao") {
						return `<div class="purchase-status-name sended"> ${row.purchaseStatusName}</div>`;
					}else if(row.purchaseStatusName == "Đang xử lý") {
						return `<div class="purchase-status-name processing"> ${row.purchaseStatusName}</div>`;
					}else 
						return `<div class="purchase-status-name wating"> ${row.purchaseStatusName}</div>`;
				} 
			},
			{
				render: function(data, type, row) {
					return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.purchaseDetailId}" data-name="${row.productName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> 
							| 
							<a class="delete-btn" data-id="${row.purchaseDetailId}" data-name="${row.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
				}
			},
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
		$('.modal-title').text('Duyệt Đơn Hàng');
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
				$("#phoneNumber").val(responseData[0].phoneNumber);
				$("#deliveryAddress").val(responseData[0].deliveryAddress);
				$("#notePurchase").val(responseData[0].notePurchase);
				var purchaseStatusId = responseData[0].purchaseStatusId;
				switch(purchaseStatusId) {
					case purchaseStatusId = 1:
						$('#purchaseStatusName').find('option[value="1"]').attr("selected", "selected");
						break;
					case purchaseStatusId = 2:
						$('#purchaseStatusName').find('option[value="2"]').attr("selected", "selected");
						break;
					case purchaseStatusId = 3:
						$('#purchaseStatusName').find('option[value="3"]').attr("selected", "selected");
						break;
					case purchaseStatusId = 4:
						$('#purchaseStatusName').find('option[value="4"]').attr("selected", "selected");
						break;
					default:
						$('#purchaseStatusName').find('option[value="5"]').attr("selected", "selected");
				}
				
				$("#salePriceText").val(currencyFormat(responseData[0].salePrice));
				$("#quantityText").val('x' + responseData[0].quantity);
				$("#totalPrice").val(currencyFormat(responseData[0].salePrice*responseData[0].quantity) + " ₫");
				/*$("#purchaseStatusName").val(responseData[0].purchaseStatusName);*/
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
						showNotification(true, responseData.responseMsg);
					} else if(responseData.responseCode == 1 || responseData.responseCode == 0) {
						showNotification(false, responseData.responseMsg)
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
				if(responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					showNotification(true, responseData.responseMsg)
				} else {
					showNotification(false, responseData.responseMsg)
				}
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
