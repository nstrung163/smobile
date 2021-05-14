var table;
var url = '/admin/users';
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
				{ className: "td-id", "targets": [0] },
				{ className: "td-action", "targets": [10] }
			],
			"order": [[0, 'desc']],
			columns: [
				{ data: 'userId' },
				{
					render: function(data, type, row) {
						if(row.avatarUrl == null || row.avatarUrl == "") {
							return `<div class='text-center image-area-brand' style="width: 70px">
									<a href="/images/avatar-user-default.png" data-toggle='lightbox' data-max-width='1000'>
										<img class='img-fluid' src="/images/avatar-user-default.png">
									</a>
								</div>`;
						} else {
							return `<div class='text-center image-area-brand'>
									<a href="/${row.avatarUrl}" data-toggle='lightbox' data-max-width='1000'>
										<img class='img-fluid' src="/${row.avatarUrl}">
									</a>
								</div>`;
						}
					}
				},
				{ data: 'username' },
				{
					render: function(data, type, row) {
						if (row.role == "ROLE_ADMIN") {
							return `<div class="role-account"> Quản Trị Viên </div>`;
						} else {
							return `<div class="role-account"> Người Dùng </div>`;
						}
					}
				},
				{ data: 'fullName' },
				{ data: 'gender' },
				{
					render: function(data, type, row) {
						return `<div class="sale-date"> ${getFormattedDate(row.birthday)}</div>`;
					}
				},
				{
					render: function(data, type, row) {
						return `<div class="text-right"> ${row.phoneNumber}</div>`;
					}
				},
				{ data: 'addressUser' },
				{ data: 'email' },
				{
					render: function(data, type, row) {
						return `<div class="action-btns text-center">
							<a class="edit-btn" data-id="${row.userId}" data-name="${row.fullName}" data-toggle="modal" data-target="#myModal">
								<i class="icon-edit-btn fas fa-edit"></i>
							</a> | 
							<a class="delete-btn" data-id="${row.userId}" data-name="${row.fullName}" data-toggle="modal" data-target="#confirmDeleteModal">
								<i class="icon-delete-btn fas fa-trash-alt"></i>
							</a>
						</div>`;
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

	/** Show modal form update user */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('.modal-title').text('Chỉnh Sửa Thông Tin Tài Khoản');
		$('#btnSubmitUser').text('Cập nhật');
		$.ajax({
			url: '/admin/user/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#userInfoForm'));
				$("#userId").val(responseData.userId);
				$("#username").val(responseData.username);
				$("#fullName").val(responseData.fullName);
				$("#birthday").val(responseData.birthday);
				$("#password").val(responseData.password);
				$("#role").val(responseData.role);
				$("#statusUser").val(responseData.statusUser);
				if(responseData.gender == "Nam") {
					$('input[name=gender][value="Nam"]').prop("checked", true);
				} else if(responseData.gender == "Nữ"){
					$('input[name=gender][value="Nữ"]').prop("checked", true);
				} else {
					$('input[name=gender][value="Khác"]').prop("checked", true);
				}
				$("#gender").val(responseData.gender);
				$("#phoneNumber").val(responseData.phoneNumber);
				$("#email").val(responseData.email);
				$("#addressUser").val(responseData.addressUser);
				var avatarUrl = responseData.avatarUrl;
				if (avatarUrl == null || avatarUrl == "") {
					avatarUrl = '/images/avatar-user-default.png';
					$("#logoImg img").attr('src',avatarUrl)
				} else {
					$("#logoImg img").attr('src', '/' + avatarUrl)
				}
				$("#avatarUrl").val(avatarUrl);
			}
		})
	})

	/** Submit Update user */
	$("#btnSubmitUser").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($('#userInfoForm')[0]);
		var $userId = $('#userId');
		var isAddAction = $userId.val() == undefined || $userId.val() == "";

		$("#userInfoForm").validate({
			rules: {
				fullName: {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				birthday: {
					required: true,
				},
				phoneNumber: {
					required: true,
					number: true,
					minlength: 9,
					maxlength: 13,
					valid_phone: true
				},
				email: {
					required: true,
					email: true
				},
				addressUser: {
					required: true,
					minlength: 10,
					maxlength: 200
				},
				avatarFile: {
					required: isAddAction
				}
			},
			messages: {
				fullName: {
					required: "Họ và Tên không được để trống",
					minlength: "Chiều dài họ tên phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài họ tên không vượt quá 100 ký tự"
				},
				birthday: {
					required: "Ngày sinh không được để trống",
				},
				phoneNumber: {
					required: "Số điện thoại không được để trống",
					number: "Số điện phải là kiểu số",
					minlength: "Chiều dài số điện thoại phải lớn hơn 9 số",
					maxlength: "Chiều dài số điện thoại không vượt quá 13 số",
					valid_phone: "Vui lòng nhập đúng định dạng số điện thoại Việt Nam"
				},
				email: {
					required: "Email là trường bắt buộc",
					email: "Email chưa đúng định dạng"
				},
				addressUser: {
					required: "Địa chỉ không được để trống",
					minlength: "Chiều dài của địa chi phải lớn hơn 10 ký tự",
					maxlength: "Chiều dài của địa chỉ vượt quá 200 ký tự"
				}
				,
				avatarFile: {
					required: "Vui lòng chọn ảnh đại diện"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#userInfoForm").valid()) {
			$.ajax({
				url: '/admin/user/' + (isAddAction ? "add" : "update"),
				type: isAddAction ? "POST" : "PUT",
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
						showNotification(true, responseData.responseMsg)
					} else if (responseData.responseCode == 1 || responseData.responseCode == 0) {
						showNotification(false, responseData.responseMsg)
					}
				},
				error: function(e) {
					alert('Cập nhật tài khoản không thành công! ' + JSON.stringify(e));
				}
			})
		}

	})

	/** Show modal delete user */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteFullName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})

	/** Submit delete user */
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/admin/user/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					showNotification(true, responseData.responseMsg)
				} else {
					showNotification(false, responseData.responseMsg)
				}
			},
			error: function(e) {
				console.log('error: ' + $(this).data('id'))
				alert('Xóa tài khoản không thành công: ' + JSON.stringify(e));
			}
		})
	})

})

function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}
