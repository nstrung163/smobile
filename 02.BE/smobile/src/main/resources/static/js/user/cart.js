var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1; //January is 0!
var yyyy = today.getFullYear();
if (dd < 10) { dd = '0' + dd }
if (mm < 10) { mm = '0' + mm }
today = yyyy + '-' + mm + '-' + dd;

/** Initialization value for date of order  */
$('input[name=dateOfOrder]').val(today);

/** Submit form checkout */
var $formCheckout = $('#formCheckout')
$('#btnSubmitCheckout').on('click', function(event) {
	event.preventDefault();
	var formData = new FormData($formCheckout[0]);
	var userId = formData.get("userId");
	var dateOfOrder = formData.get("dateOfOrder");
	var fullName = formData.get("fullName");
	console.log(`Value of userId:  ${userId}`);
	console.log(`Value of dateOfOrder:  ${dateOfOrder}`);
	console.log(`Value of fullName:  ${fullName}`);

	$formCheckout.validate({
		ignore: [],
		rules: {
			fullName: {
				required: true,
				minlength: 2,
				maxlength: 200
			},
			deliveryAddress: {
				required: true,
				minlength: 10,
				maxlength: 200
			},
			phoneNumber: {
				required: true,
				number: true,
				minlength: 9,
				maxlength: 13,
				valid_phone: true
			},
		},
		messages: {
			fullName: {
				required: "Họ tên là trường bắt buộc",
				minlength: "Chiều dài họ tên không được nhỏ hơn 2 ký tự",
				maxlength: "Chiều dài họ tên không được lơn hơn 200 ký tự"
			},
			deliveryAddress: {
				required: "Địa nhận hàng là trường bắt buộc",
				minlength: "Chiều dài địa nhận hàng không được nhỏ hơn 10 ký tự",
				maxlength: "Chiều dài địa nhận hàng không được lơn hơn 200 ký tự"
			},
			phoneNumber: {
				required: "Số điện thoại là trường bắt buộc",
				number: "Vui lòng nhập dạng số cho số điện thoại",
				minlength: "Số điện thoại không được nhỏ hơn 10 số",
				maxlength: "Chiều dài địa nhận hàng không được lớn hơn 13 số",
				valid_phone: "Vui lòng nhập đúng định dạng số điện thoại Việt Nam"
			},
		},
		errorElement: "div",
		errorClass: "error-message-invalid"
	});
	if($formCheckout.valid()) {
		$.ajax({
			url: '/user/checkout',
			type: 'POST',
			processData: false,
			contentType: false,
			data: formData,
			success: function(responseData) {
				if(responseData.responseCode == 100) {
					alert(responseData.responseMsg)
					window.location = '/user/history-buy';
				} else {
					showNotification(false, responseData.responseMsg);
				}
			}, 
			error: function(e) {
				showNotification(false, `Thêm mới đơn hàng thất bại do: ${JSON.stringify(e)}`);
			}
		})
	}
})

$('.minus-quantity').on('click', function(event) {
	event.preventDefault();
	var urlMinus = $(this).attr("href");
	console.log(`Url minus: ${urlMinus}`)
	$.ajax({
		url: urlMinus,
		type: 'PUT',
		processData: false,
		contentType: false,
		success: function() {
			alert(`Giảm số lượng sản phẩm thành công`);
			window.location = '/user/cart';
		},
		error: function(e) {
			alert(`Giảm số lượng sản phẩm thất bại do ${JSON.stringify(e)}`)
		}
	})
})


$('.plus-quantity').on('click', function(event) {
	event.preventDefault();
	var urlMinus = $(this).attr("href");
	console.log(`Url minus: ${urlMinus}`)
	$.ajax({
		url: urlMinus,
		type: 'PUT',
		processData: false,
		contentType: false,
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				alert(responseData.responseMsg);
				window.location = '/user/cart';
			} else {
				alert(responseData.responseMsg);
			}
			
		},
		error: function(e) {
			alert(`Chỉnh sửa số lượng sản phẩm thất bại do ${JSON.stringify(e)}`)
		}
	})
})

$('.remove-product').on('click', function(event) {
	event.preventDefault();
	var urlMinus = $(this).attr("href");
	console.log(`Url minus: ${urlMinus}`)
	$.ajax({
		url: urlMinus,
		type: 'DELETE',
		processData: false,
		contentType: false,
		success: function() {
			window.location = '/user/cart';
		},
		error: function(e) {
			alert(`Chỉnh sửa số lượng sản phẩm thất bại do ${JSON.stringify(e)}`)
		}
	})
})
$('.box-card__title--back--home').click(function(event) {
	event.preventDefault();
	window.history.back();
})

jQuery.validator.addMethod('valid_phone', function (value) {
    return /([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})\b/.test(value);
});
