$(document).ready(function () {

	var productId = window.location.pathname;
	productId = productId.replace("/product/", "");
	$('#demo').pagination({
		dataSource: '/api/v1/web/comment/product/' + productId,
		locator: 'items',
		totalNumber: 20,
		pageSize: 3,
		ajax: {
			beforeSend: function () {
				container.prev().html('Loading...');
			}
		},
		callback: function (response, pagination) {
			var dataHtml = '<ul>';
			var pageStart = (pagination.pageNumber - 1) * pagination.pageSize;
			var pageEnd = pageStart + pagination.pageSize;
			var pageItems = response.slice(pageStart, pageEnd);
			$.each(pageItems, function (index, item) {
				dataHtml += '<li>' + item.title + '</li>';
			});

			dataHtml += '</ul>';

			container.prev().html(dataHtml);
		}
	})
});