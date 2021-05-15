var table;
var url = '/admin/products-info';
function initTableData() {
	/** Data from an URL */
	$.get(url, function(responseData) {
		table = $('#dataTable').DataTable({
			orderCellsTop: true,
			processing: true,
			data: responseData,
			"columnDefs": [
				{ className: "td-id", "targets": [0] },
				{ className: "td-id", "targets": [4] },
				{ className: "td-id", "targets": [7] },
				{ className: "td-id", "targets": [8] },
				{ className: "td-id", "targets": [11] },
				{ className: "td-action", "targets": [14] },
			],
			"order": [[0, 'desc']],
			columns: [
				{ data: 'productInfoId' },
				{ data: 'productEntity.productName' },
				{ data: 'screen' },
				{ data: 'operatingSystem' },
				{ data: 'frontCamera' },
				{ data: 'rearCamera' },
				{ data: 'cpu' },
				{ data: 'ram' },
				{ data: 'internalMemory' },
				{
					render: function(data, type, row) {
						return `<div class="custom-line-row">${ row.sim }</div>`
					}
				},
				{ data: 'batteryCapacity' },
				{ data: 'numberOfBatteryCapacity' },
				{
					render: function(data, type, row) {
						return `<div class="custom-line-row">${ row.introduction }</div>`
					}
				},
				{ data: 'typeProduct' },
				{
					render: function(data, type, row) {
						return `<div class="action-btns text-center">
								<a class="edit-btn" data-id="${row.productInfoId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#myModal">
									<i class="icon-edit-btn fas fa-edit"></i>
								</a> | 
								<a class="delete-btn" data-id="${row.productInfoId}" data-name="${row.productEntity.productName}" data-toggle="modal" data-target="#confirmDeleteModal">
									<i class="icon-delete-btn fas fa-trash-alt"></i>
								</a>
							</div>`;
					}
				}
			],
			dom: 'Bfrtip',
			buttons: [
				{
					text: 'Thêm Mới Chi Tiết Sản Phẩm',
					action: function(e, dt, node, config) {
						resetFormModal($('#productInfoForm'));
						$('.modal-title').text('Thêm Mới Chi Tiết Sản Phẩm');
						$('#btnSubmitProductInfo').text('Đồng ý');
						$('#productInfoId').parent().addClass("d-none");
						$('#myModal').modal('toggle');
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
	/** Hover change background tag thead */
	$("#list-header").on({
		mouseenter: function() {
			$(this).css("background-color", "lightgray");
		},
		mouseleave: function() {
			$(this).css("background-color", "lightblue");
		}
	})

	/** Show modal form update product info */
	$("#dataTable").on('click', '.edit-btn', function() {
		$('#productInfoId').parent().removeClass("d-none");
		$('.modal-title').text('Chỉnh Sửa Chi Tiết Sản Phẩm');
		$('#btnSubmitProductInfo').text('Cập nhật');
		$.ajax({
			url: '/admin/product-info/' + $(this).data('id'),
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				resetFormModal($('#productInfoForm'));
				$("#productInfoId").val(responseData.productInfoId);
				$("#screen").val(responseData.screen);
				$("#operatingSystem").val(responseData.operatingSystem);
				$("#frontCamera").val(responseData.frontCamera);
				$("#rearCamera").val(responseData.rearCamera);
				$("#cpu").val(responseData.cpu);
				$("#ram").val(responseData.ram);
				$("#internalMemory").val(responseData.internalMemory);
				$("#sim").val(responseData.sim);
				$("#batteryCapacity").val(responseData.batteryCapacity);
				$("#introduction").val(responseData.introduction);
				$("#typeProduct").val(responseData.typeProduct);
				$("#numberOfBatteryCapacity").val(responseData.numberOfBatteryCapacity);
				$("#productId").val(responseData.productEntity.productId);
			}
		})
	})

	/** Submit Update Product Info */
	$("#btnSubmitProductInfo").on('click', function(event) {
		event.preventDefault();
		var $productInfoId = $('#productInfoId');
		var isAddAction = $productInfoId.val() == undefined || $productInfoId.val() == "";
		$("#productInfoForm").validate({
			rules: {
				screen: {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				operatingSystem: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				frontCamera: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				rearCamera: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				cpu: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				ram: {
					required: true,
					max: 32767,
					min: 1
				},
				internalMemory: {
					required: true,
					max: 32767,
					min: 1
				},
				sim: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				batteryCapacity: {
					required: true,
					minlength: 2,
					maxlength: 200
				},
				typeProduct: {
					required: true
				},
				numberOfBatteryCapacity: {
					required: true,
					max: 32767,
					min: 1
				},
				productId: {
					required: true
				}
			},
			messages: {
				screen: {
					required: "Thông tin màn hình không được để trống",
					minlength: "Chiều dài thông tin màn hình phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin màn hình không vượt quá 200 ký tự"
				},
				operatingSystem: {
					required: "Thông tin hệ điều hành không được để trống",
					minlength: "Chiều dài thông tin hệ điều hàng phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin hệ điều hàng không vượt quá 200 ký tự"
				},
				frontCamera: {
					required: "Thông tin camera trước không được để trống",
					minlength: "Chiều dài thông tin camera trước phải lơn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin camera trước không vượt quá 200 ký tự"
				},
				rearCamera: {
					required: "Thông tin camera sau không được để trống",
					minlength: "Chiều dài thông tin camera sau phải lớn 2 ký tự",
					maxlength: "Chiều dài thông tin camera sau không vượt quá 200 ký tự"
				},
				cpu: {
					required: "Thông tin CPU không được để trống",
					minlength: "Chiều dài thông tin CPU phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin CPU không vượt quá 200 ký tự"
				},
				ram: {
					required: "Thông tin RAM không được để trống",
					max: "Thông tin RAM không vượt quá 32767",
					min: "Thông tin RAM phải lớn hơn 1"
				},
				internalMemory: {
					required: "Thông tin bộ nhớ trong không được để trống",
					max: "Thông tin bộ nhớ trong không vượt quá 32767",
					min: "Thông tin bộ nhớ trong phải lớn hơn 1"
				},
				sim: {
					required: "Thông tin SIM không được để trống",
					minlength: "Chiều dài thông tin SIM phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin SIM không vượt quá 200 ký tự"
				},
				batteryCapacity: {
					required: "Thông tin chi tiết PIN không được để trống",
					minlength: "Chiều dài thông tin chi tiết PIN phải lớn hơn 2 ký tự",
					maxlength: "Chiều dài thông tin chi tiết PIN không vượt quá 200 ký tự"
				},
				typeProduct: {
					required: "Vui lòng chọn loại sản phẩm"
				},
				numberOfBatteryCapacity: {
					required: "Thông tin dung lượng PIN không được để trống",
					max: "Thông tin dung lượng PIN không vượt quá 32767",
					min: "Thông tin dung lượng PIN phải lớn hơn 1"
				},
				productId: {
					required: "Vui lòng chọn loại sản phẩm"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		if ($("#productInfoForm").valid()) {
			var formData = new FormData($('#productInfoForm')[0]);
			$.ajax({
				url: '/admin/product-info/' + (isAddAction ? "add" : "update"),
				type: isAddAction ? 'POST' : 'PUT',
				processData: false,
				contentType: false,
				data: formData,
				success: function(responseData) {
					console.log(responseData);
					if (responseData.responseCode == 100) {
						/**Reload datatable */
						reloadDataTable();
						$('#myModal').modal('toggle');
						showNotification(true, responseData.responseMsg)
					} else if (responseData.responseCode == 1 || responseData.responseCode == 0) {
						showNotification(false, responseData.responseMsg)
					}
				},
				error: function(e) {
					alert((isAddAction ? 'Cập nhật' : 'Thêm mới') + ' chi tiết sản phẩm không thành công! ' + JSON.stringify(e));
				}
			})
		}

	})

	/** Show modal delete product */
	$("#dataTable").on('click', '.delete-btn', function() {
		$("#deleteProductName").text($(this).data("name"));
		$("#btnSubmitDelete").attr('data-id', $(this).data('id'));
	})

	/** Submit delete product*/
	$("#btnSubmitDelete").on('click', function() {
		$.ajax({
			url: '/admin/product-info/' + $(this).attr('data-id'),
			type: 'DELETE',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					reloadDataTable();
					$('#confirmDeleteModal').modal('toggle');
					showNotification(true, responseData.responseMsg)
				} else {
					showNotification(false, responseData.responseMsg)
				}
			},
			error: function(e) {
				alert('Xóa chi tiết sản phẩm thành công không thành công: ' + JSON.stringify(e));
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