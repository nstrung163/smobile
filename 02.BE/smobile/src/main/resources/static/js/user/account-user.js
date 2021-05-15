/** Submit Update user */
$("#btnSubmit").on('click', function(event) {
	event.preventDefault();
	var formData = new FormData($('#userInfoForm')[0]);

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
				required: true
			},
			username: {
				required: true,
				minlength: 5,
				maxlength: 20,
				username: true
			},
			password: {
				required: true,
				minlength: 6,
				maxlength: 20,
				passwordChars: true
			},
			confirmPassword: {
				required: true,
				minlength: 6,
				maxlength: 20,
				equalTo: "#password",
				passwordChars: true
			},
			phoneNumber: {
				required: true,
				number: true,
				minlength: 9,
				maxlength: 13,
				valid_phone: true
			},
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
			},
			username: {
				required: "Vui lòng nhập Tên Tài Khoản",
				minlength: "Vui lòng nhập tối thiểu 5 kí tự",
				maxlength: "Vui lòng nhập tối đa 20 kí tự",
				username: "Vui lòng không nhập kí tự đặc biệt"
			},
			password: {
				required: "Vui lòng nhập Mật Khẩu",
				minlength: "Vui lòng nhập tối thiểu 6 kí tự",
				maxlength: "Vui lòng nhập tối đa 20 kí tự",
				passwordChars: "Vui lòng nhập Mật Khẩu bao gồm cả chữ (a-z) và số (0-9)"
			},
			confirmPassword: {
				required: "Vui lòng nhập Mật Khẩu Xác Nhận",
				equalTo: "Xác nhận Mật Khẩu chưa đúng",
				minlength: "Vui lòng nhập tối thiểu 6 kí tự",
				maxlength: "Vui lòng nhập tối đa 20 kí tự",
				passwordChars: "Vui lòng nhập Mật Khẩu bao gồm cả chữ (a-z) và số (0-9)"
			},
			phoneNumber: {
				required: "Số điện thoại không được để trống",
				number: "Số điện phải là kiểu số",
				minlength: "Chiều dài số điện thoại phải lớn hơn 9 số",
				maxlength: "Chiều dài số điện thoại không vượt quá 13 số",
				valid_phone: "Vui lòng nhập đúng định dạng số điện thoại Việt Nam"
			},
		},
		errorElement: "div",
		errorClass: "error-message-invalid"
	});
	if ($("#userInfoForm").valid()) {
		$.ajax({
			url: '/user/register/',
			type: 'POST',
			processData: false,
			contentType: false,
			enctype: 'multipart/form-data',
			data: formData,
			success: function(responseData) {
				console.log(responseData);
				if (responseData.responseCode == 100) {
					alert("Đăng Ký Tài Khoản Thành Công");
					window.history.back();
				} else {
					alert("Đăng ký tài khoản không thành công do:" + responseData.responseMsg)
				}
			},
			error: function(e) {
				alert('Đăng ký tài khoản không thành công! ' + JSON.stringify(e));
			}
		})
	}

})