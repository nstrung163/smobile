var table;
var url = '/admin/brands';
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
			{ className: "td-action", "targets": [ 4 ] }
		  ],
		"order": [[ 0, 'desc' ]],
		columns: [
			{ data: 'brandId' },
			{ data: 'brandName' },
			{ render: function(data, type, row) {
					return `<div class='text-center image-area-brand'>
								<a href="/${row.logo}" data-toggle='lightbox' data-max-width='1000'>
									<img class='img-fluid' src="/${row.logo}">
								</a>
							</div>`;
				} 
			},
			{ data: 'description' },
			{
				render: function(data, type, row) {
					return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.brandId}" data-name="${row.brandName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> | 
							<a class="delete-btn" data-id="${row.brandId}" data-name="${row.brandName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
				}
			}
		],
		dom: 'Bfrtip',
		buttons: [
			{
				text: 'Thêm Mới Nhãn Hiệu',
				action: function(e, dt, node, config) {
					resetFormModal($('#brandInfoForm'));
					$('.modal-title').text('Thêm Mới Nhãn Hiệu');
					$('#btnSubmitBrand').text('Đồng ý');
					$('#brandId').parent().addClass("d-none");
					$('#myModal').modal('toggle');
					$('.preview-image-upload img').attr('src', "/images/image-demo.png");
				}
			}
		]
	  });
	}).fail(function() {
		alert("Lỗi khi lấy dữ liệu từ hệ thống!");
	})
}

$(document).ready(function() {
	initTableData();

	/** Show modal form update user */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#brandId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Nhãn Hiệu');
		$('#btnSubmitBrand').text('Cập nhật');
		$.ajax({
			url: '/admin/brand/' + $(this).data('id'),
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
				if(brandLogo == null || brandLogo == "") {
					brandLogo = '/images/image-demo.png';
				}
				
				$("#logoImg img").attr('src', '/' + brandLogo)
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
				url: '/admin/brand/' + (isAddAction ? "add" : "update"),
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
						showNotification(true, responseData.responseMsg)
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

	/** Show modal delete brand */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteBrandName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})
	

	/** Submit delete brand */
	$("#btnSubmitDelete").on('click', function() {
		console.log('.data("") = ' + $(this).data('id') + ', .attr= ' + $(this).attr('data-id'));
		$.ajax({
			url: '/admin/brand/' + $(this).attr('data-id'),
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
				alert('Xóa nhãn hiệu không thành công: ' + JSON.stringify(e));
			}
		})
	})
	
})

function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}
