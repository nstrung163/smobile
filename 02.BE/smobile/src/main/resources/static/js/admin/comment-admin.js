var table;
var url = '/admin/comments';
function initTableData() {
	/** Data from an URL */
	$.get(url, function(responseData) {
		table = $('#dataTable').DataTable({
			orderCellsTop: true,
			processing: true,
			data: responseData,
			"columnDefs": [
				{ className: "td-id", "targets": [0 ] },
				{ className: "td-action", "targets": [7] }
			],
			"order": [[0, 'desc']],
			columns: [
				{ data: 'commentId' },
				{ data: 'productEntity.productName' },
				{ data: 'commentContent' },
				{
					render: function(data, type, row) {
						return `<div class="quantity-product"> ${row.rateNumber}</div>`;
					}
				},
				{ render: function(data, type, row) {
					if(row.imageCommentUrl != null) {
						return `<div class='text-center image-area-brand'>
									<a href="/${row.imageCommentUrl}" data-toggle='lightbox' data-max-width='1000'>
										<img class='img-fluid' src="/${row.imageCommentUrl}">
									</a>
								</div>`;
					} else {
						return `<div class='text-center image-area-brand'>
								</div>`;
						}
					} 
				},
				{
					render: function(data, type, row) {
						return `<div class="sale-date"> ${getFormattedDate(row.dateOfComment)}</div>`;
					}
				},
				{ data: 'userEntity.username' },
				{
					render: function(data, type, row) {
						return `<div class="action-btns text-center">
								<a class="delete-btn" data-id="${row.commentId}" data-name="${row.commentId}" data-toggle="modal" data-target="#confirmDeleteModal">
									<i class="icon-delete-btn fas fa-trash-alt"></i>
								</a>
							</div>`;
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
	/** Show modal delete product */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteCommentId").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})

	/** Submit delete product*/
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/admin/comment/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				console.log('responseCode: ' + responseData.responseCode);
				if (responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					showNotification(true, responseData.responseMsg)
				} else {
					showNotification(false, responseData.responseMsg)
				}
			},
			error: function(e) {
				alert('Xóa sản phẩm thành công không thành công: ' + JSON.stringify(e));
			}
		})
	})
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

/**
*
* Get current date
*
* @return current date
*/
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();
if (dd < 10) {
	dd = '0' + dd;
}
if (mm < 10) {
	mm = '0' + mm;
}
today = yyyy + '-' + mm + '-' + dd;

