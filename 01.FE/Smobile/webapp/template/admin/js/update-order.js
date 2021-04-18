$(document).ready(function () {

	$(document).delegate('#update', 'click', function (event) {
		event.preventDefault();

		var orderId = $('#orderId').val();
		var orderStatusId = $('#orderStatusId').val();

		$.ajax({
			type: "PUT",
			contentType: "application/json; charset=utf-8",
			url: "/api/v1/admin/order/" + orderId + "/status/" + orderStatusId,
			data: JSON.stringify(
				{
					'orderId': orderId,
					'orderStatusId': orderStatusId,
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