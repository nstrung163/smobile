$(document).ready(function () {

	var orderId = window.location.pathname;
	orderId = orderId.replace("/admin/order/", "");
	orderId = orderId.replace("/view", "")
	$('#dataTable').DataTable({
		"ajax": {
			"url": "/api/v1/admin/order/" + orderId + "/detail",
			"type": "GET",
			"dataType": "json",
			"dataSrc": ""
		},
		"columns": [
			{ "data": "orderDetailId" },
			{ "data": "productName" },
			{ "data": "quantity" },
			{ "data": "size" },
			{ "data": "salePrice" }
		]
	});

	$(document).delegate('#updateOrderStatus', 'click', function (event) {
		event.preventDefault();

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
				window.setTimeout(function () { location.reload() }, 500)
			},
			error: function (err) {
				$("#msg").html("<span style='color: red'>Cập nhật thất bại!</span>").fadeIn().fadeOut(500, function () {
					$(this).remove();
				});
			}
		});
	});
});