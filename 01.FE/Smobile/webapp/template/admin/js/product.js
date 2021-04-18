$(document).ready(function () {

	var dataSend = {
		productName: $().val(),
		productId: $().val(),
		brandId: $().val(),
		categoryId: $().val(),
		dateCreated: $().val(),
		price: $().val(),
		salePrice: $().val(),
		status: $().val(),
		description: $().val()
	};
	var updateUrl = "window.location.href='/admin/product/";
	var endUrl = "'";

	$('#dataTable').DataTable({
		"ajax": {
			"url": "/api/v1/admin/product/list",
			"type": "GET",
			"data": dataSend,
			"dataType": "json",
			"dataSrc": ""
		},
		"columns": [
			{ "data": "productId" },
			{ "data": "productName" },
			{ "data": "brandId" },
			{ "data": "categoryId" },
			{ "data": "dateCreated" },
			{ "data": "price" },
			{ "data": "salePrice" },
			{ "data": "status" },
			{ 'data': null, title: 'Action', wrap: true, "render": function (item) { return '<div class="btn-group"> <button type="button" onclick="' + updateUrl + item.productId + '/view' + endUrl + '" class="btn btn-primary">View</button><button type="button" onclick="' + updateUrl + item.productId + '/edit' + endUrl + '" class="btn btn-success">Edit</button><button class="btn btn-danger delete" id="' + item.productId + '">Delete</button></td></div>' } }
		]
	});

	$(document).delegate('.delete', 'click', function () {
		if (confirm('Xác nhận xoá sản phẩm này?')) {
			var id = $(this).attr('id');
			var parent = $(this).parent().parent();
			$.ajax({
				type: "DELETE",
				url: "/api/v1/admin/product/" + id,
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