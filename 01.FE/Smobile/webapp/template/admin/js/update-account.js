$(document).ready(function () {

	$(document).delegate('#update', 'click', function (event) {
		event.preventDefault();

		var control = "account";
		var accountId = $('#accountId').val();
		var username = $('#username').val();
		var fullName = $('#fullName').val();
		var avatar = $("#avatar").val();
		var phone = $("#phone").val();
		var address = $("#address").val();
		var email = $("#email").val();
		var status = $('#status').val();
		var password = $("#password").val();
		var role = $("#role").val();

		$.ajax({
			type: "PUT",
			contentType: "application/json; charset=utf-8",
			url: "/api/v1/admin/" + control + "/" + accountId,
			data: JSON.stringify(
				{
					'accountId': accountId,
					'username': username,
					'fullName': fullName,
					'avatar': avatar,
					'phone': phone,
					'address': address,
					'email': email,
					'status': status,
					'password': password,
					'role': role
				}
			),
			cache: false,
			success: function (result) {
				$("#msg").html("<span style='color: green'>Cập nhật thành công!</span>").fadeIn().fadeOut(3000, function () {
					$(this).remove();
				});
				window.setTimeout(function () { location.reload() }, 1000)
			},
			error: function (err) {
				$("#msg").html("<span style='color: red'>Cập nhật thất bại!</span>").fadeIn().fadeOut(3000, function () {
					$(this).remove();
				});
			}
		});
	});
});