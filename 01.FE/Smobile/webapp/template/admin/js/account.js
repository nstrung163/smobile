$(document).ready(function () {


	var updateUrl = "window.location.href='/admin/account/";
	var endUrl = "'";
	

	$('#dataTable').DataTable({
		"ajax": {
			"url": "/api/v1/admin/account/list",
			"type": "GET",
			"dataType": "json",
			"dataSrc": ""
		},
		"columns": [
			{ "data": "accountId" },
			{ "data": "username" },
			{ "data": "fullName" },
			{ "data": "address" },
			{ "data": "phone" },
			{ "data": "email" },
			{ "data": "dateCreated" },
			{ 'data': null, title: 'Action', wrap: true, "render": function (item) { return '<div class="btn-group"><button type="button" onclick="' + updateUrl + item.accountId + '/edit' + endUrl + '" class="btn btn-success">Edit</button><button class="btn btn-danger delete" id="' + item.accountId + '">Delete</button></td></div>' } }
		]
	});
	console.log(data);
	$(document).delegate('.delete', 'click', function () {
		if (confirm('Xác nhận xoá sản phẩm này?')) {
			var id = $(this).attr('id');
			console.log(id);
			var parent = $(this).parent().parent();
			$.ajax({
				type: "DELETE",
				url: "/api/v1/admin/account/" + id,
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