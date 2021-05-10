var table;
var url = '/admin/product-images';
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
			{ data: 'productImageId' },
			{ data: 'productEntity.productName' },
			{ render: function(data, type, row) {
					return `<div class='text-center image-area-brand'><a href="/${row.imageUrl}" data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src="/${row.imageUrl}"></div>`;
				} 
			},
			{
				render: function(data, type, row) {
					return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.productImageId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> | 
							<a class="delete-btn" data-id="${row.productImageId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
				}
			}
		],
		dom: 'Bfrtip',
		buttons: [
			{
				text: 'Thêm Mới Ảnh Sản Phẩm',
				action: function(e, dt, node, config) {
					resetFormModal($('#productImageInfoForm'));
					$('.modal-title').text('Thêm Mới Nhãn Hiệu');
					$('#btnSubmitProductImage').text('Đồng ý');
					$('#productImageId').parent().addClass("d-none");
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

	/** Show modal form update product image */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#productImageId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Ảnh Sản Phẩm');
		$('#btnSubmitProductImage').text('Cập nhật');
		$.ajax({
			url: '/admin/product-image/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#productImageInfoForm'));
				$("#productImageId").val(responseData.productImageId);
				$("#productId").val(responseData.productEntity.productId);
				var image = responseData.imageUrl;
				if(image == null || image == "") {
					image = '/images/image-demo.png';
				}
				
				$("#image img").attr('src', image)
				$("#imageUrl").val(image);
			}
		})
	})

	/** Submit update product image */
	$("#btnSubmitProductImage").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($('#productImageInfoForm')[0]);
		var $productImageId = $('#productImageId');
		var isAddAction = $productImageId.val() == undefined || $productImageId.val() == "";
		$("#productImageInfoForm").validate({
			rules: {
				imagesFile: {
					required: isAddAction
				}
			},
			messages: {
				imagesFile: {
					required: "Ảnh của sản phẩm không được để trống!"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#productImageInfoForm").valid()) {
			$.ajax({
				url: '/admin/product-image/' + (isAddAction ? "add" : "update"),
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
					alert(isAddAction ? "Thêm mới ảnh" : "Cật nhật" + ' cho sản phẩm không thành công! ' + JSON.stringify(e));
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
			url: '/admin/product-image/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				if(responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					$('#announcemnet strong:eq(0)').removeClass("text-warning").addClass("text-success");
					$('#notification').text(responseData.responseMsg);
					$("#announcemnet").toast('show');
				} else {
					reloadDataTable();
					$('#announcemnet strong:eq(0)').removeClass("text-success").addClass("text-warning");
					$('#notification').text(responseData.responseMsg);
					$("#announcemnet").toast('show');
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
