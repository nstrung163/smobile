var table;
var url = '/admin/product-options';
function initTableData() {
/** Data from an URL */
$.get(url, function(responseData) {
	/*alert(`data=${JSON.stringify(responseData)}`)*/
	table = $('#dataTable').DataTable({
		orderCellsTop: true,
		fixedHeader: true,
		processing: true,
		data: responseData,
		"columnDefs": [ 
			{ className: "td-id", "targets": [ 0 ] },
			{ className: "td-sale-price", "targets": [ 3 ] },
			{ className: "td-action", "targets": [ 6 ] }
		],
		"order": [[ 0, 'desc' ]],
		columns: [
			{ data: 'productOptionId' },
			{ data: 'colorProductName' },
			{ render: function(data, type, row) {
					return `<div class='text-center'>${row.memoryProduct}GB</div>`;
				} 
			},
			{ render: function(data, type, row) {
					return `<div class='text-right'>${currencyFormat(row.salePrice)} ₫</div>`;
				} 
			},
			{ data: 'productEntity.productName' },
			{ render: function(data, type, row) {
					return `<div class='text-center image-area-brand'>
								<a href="/${row.imageUrl}" data-toggle='lightbox' data-max-width='1000'>
									<img class='img-fluid' src="/${row.imageUrl}">
								</a>
							</div>`;
				} 
			},
			{
				render: function(data, type, row) {
					return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.productOptionId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> | 
							<a class="delete-btn" data-id="${row.productOptionId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
				}
			}
		],
		dom: 'Bfrtip',
		buttons: [
			{
				text: 'Thêm Mới Tùy Chọn Sản Phẩm',
				action: function(e, dt, node, config) {
					resetFormModal($('#productOptionInfoForm'));
					$('.modal-title').text('Thêm Mới Tùy Chọn Sản Phẩm');
					$('#btnSubmitProductOption').text('Đồng ý');
					$('#productOptionId').parent().addClass("d-none");
					$('#myModal').modal('toggle');
					$('.preview-image-upload img').attr('src', "/images/image-demo.png");
				}
			}
		]
	});
}).fail(function(e) {
	alert("Lỗi khi lấy dữ liệu từ hệ thống!" + JSON.stringify(e));
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
	/** Show modal form update product image */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#productOptionId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Tùy Chọn Sản Phẩm');
		$('#btnSubmitProductOption').text('Cập nhật');
		$.ajax({
			url: '/admin/product-option/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#productOptionInfoForm'));
				$("#productOptionId").val(responseData.productOptionId);
				$("#colorProductName").val(responseData.colorProductName);
				$("#memoryProduct").val(responseData.memoryProduct);
				$("#salePrice").val(responseData.salePrice);
				$("#productId").val(responseData.productEntity.productId);
				var image = responseData.imageUrl;
				if(image == null || image == "") {
					image = '/images/image-demo.png';
				}
				
				$("#image img").attr('src','/' + image)
				$("#imageUrl").val(image);
			}
		})
	})

	/** Submit update product image */
	$("#btnSubmitProductOption").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($('#productOptionInfoForm')[0]);
		var $productOptionId = formData.get("productOptionId");
		var isAddAction = $productOptionId == undefined || $productOptionId == "";
		$("#productOptionInfoForm").validate({
			rules: {
				colorProductName: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				memoryProduct: {
					required: true,
					maxlength: 32767,
					min: 0
				},
				salePrice: {
					required: true,
					min: 1
				},
				productId: {
					required: true
				},
				imageFile: {
					required: isAddAction
				}
			},
			messages: {
				colorProductName: {
					required: "Màu sản phẩm không được để trống",
					minlength: "Chiều dài của màu phải hơn 2 ký tự",
					maxlength: "Chiều dài của màu không vượt quá 200 ký tự"
				},
				memoryProduct: {
					required: "Bộ nhớ sản phẩm không được để trống",
					maxlength: "Bộ nhớ sản phẩm không được để trống",
					min: "Bộ nhớ sản phẩm phải có giá trị lớn 0"
				},
				salePrice: {
					required: "Giá bán không được để trống",
					min: "Giá bán phải có giá trị lớn 1"
				},
				productId: {
					required: "Vui lòng chọn sản phẩm"
				},
				imageFile: {
					required: "Vui lòng chọn ảnh cho sản phẩm"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#productOptionInfoForm").valid()) {
			$.ajax({
				url: '/admin/product-option/' + (isAddAction ? "add" : "update"),
				type: isAddAction ? "POST" : "PUT",
				processData: false,
				contentType: false,
				enctype: 'multipart/form-data',
				data: formData,
				success: function(responseData) {
					console.log(responseData);
					if (responseData.responseCode == 100) {
						reloadDataTable();
						$('#myModal').modal('toggle');
						showNotification(true, responseData.responseMsg)
					} else if(responseData.responseCode == 1 || responseData.responseCode == 0) {
						showNotification(false, responseData.responseMsg)
					}
				},
				error: function(e) {
					alert(isAddAction ? "Thêm mới ảnh" : "Cật nhật" + ' cho sản phẩm không thành công do: ' + JSON.stringify(e));
				}
			})
		}
	})

	/** Show modal delete product image */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteProductName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})
	

	/** Submit delete product image */
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/admin/product-option/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				if(responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					showNotification(true, responseData.responseMsg)
				} else {
					showNotification(false, responseData.responseMsg)
					reloadDataTable();
				}
			},
			error: function(e) {
				alert('Xóa nhãn hiệu không thành công: ' + JSON.stringify(e));
			}
		})
	})
	
})

function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}
