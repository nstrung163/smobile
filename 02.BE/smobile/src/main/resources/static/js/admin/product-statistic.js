var table;
var url = '/admin/statistic/products';
function initTableData() {
	/** Data from an URL */
	$.get(url, function(responseData) {
		table = $('#dataTable').DataTable({
			orderCellsTop: true,
			processing: true,
			data: responseData,
			"columnDefs": [
				{ className: "td-id", "targets": [0] },
			],
			"order": [[4, 'desc']],
			columns: [
				{ data: 'productId' },
				{ data: 'productName' },
				{
					render: function(data, type, row) {
						if(row.quantity <= 10) {
							return `<div class="td-product-quantity-warn"> ${row.quantity}</div>`;
						} else {
							return `<div class="quantity-product-info"> ${row.quantity}</div>`;
						}
					}
				},
				{ data: 'statusProduct' },
				{
					render: function(data, type, row) {
						return `<div class="text-center"> ${row.numberOfProductsSold}</div>`;
					}
				}
			]
		});
	}).fail(function(e) {
		alert("Lỗi khi lấy dữ liệu từ hệ thống! " + JSON.stringify(e));
	})
}

$(document).ready(function() {
	initTableData();
})

/**
*
* Reload datatable
* 
* @return new datatable
*/
function reloadDataTable() {
	$('#dataTable').dataTable().fnDestroy();
	initTableData();
}

