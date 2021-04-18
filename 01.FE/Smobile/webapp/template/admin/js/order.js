$(document).ready(function () {

	var updateUrl = "window.location.href='/admin/order/";
	var endUrl = "'";

	$('#dataTable').DataTable({
		"ajax": {
			"url": "/api/v1/admin/order/list",
			"type": "GET",
			"dataType": "json",
			"dataSrc": ""
		},
		"columns": [
			{ "data": "orderId" },
			{ "data": "fullName" },
			{ "data": "dateCreated" },
			{ "data": "deliveryInfo" },
			{ "data": "paymentMethodName" },
			{ "data": "statusName" },
			{ 'data': null, title: 'Action', wrap: true, "render": function (item) { return '<div class="btn-group"> <button type="button" onclick="' + updateUrl + item.orderId + '/view' + endUrl + '" class="btn btn-primary">View</button><button type="button" onclick="' + updateUrl + item.orderId + '/edit' + endUrl + '" class="btn btn-success">Edit</button><button class="btn btn-danger delete" id="' + item.orderId + '">Delete</button></td></div>' } }
		]
	});

	$(document).delegate('.delete', 'click', function () {
		if (confirm('Xác nhận xoá đơn hàng này?')) {
			var id = $(this).attr('id');
			var parent = $(this).parent().parent();
			$.ajax({
				type: "DELETE",
				url: "/api/v1/admin/order/" + id,
				cache: false,
				success: function () {
					parent.fadeOut('slow', function () {
						$(this).remove();
					});
					location.reload(true)
				},
				error: function () {
					$('#err').html('<span style=\'color:red; font-weight: bold; font-size: 30px;\'>Error deleting record').fadeIn().fadeOut(4000, function () {
						$(this).remove();
					});
				}
			});
		}
	});
});