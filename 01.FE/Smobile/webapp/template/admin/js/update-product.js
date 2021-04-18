//insert size

$(document)
.ready(
		function() {

			$(document)
			.delegate(
					'#updateProductDetail',
					'click',
					function(event) {
						event.preventDefault();

						var control = "product";
						var productId = $('#productId').val();
						var size = $('#size').val();
						var quantity = $('#quantity').val();
						console.log(productId + " size:" + size
								+ " quantity:" + quantity);
						$
						.ajax({
							type : "POST",
							contentType : "application/json; charset=utf-8",
							url : "/api/v1/admin/"
								+ control + "/"
								+ productId
								+ "/detail",
								data : JSON
								.stringify({
									'productId' : productId,
									'size' : size,
									'quantity' : quantity
								}),
								cache : false,
								success : function(result) {
									
									$("#msgdt")
									.html(
									"<span style='color: green'>Cập nhật thành công!</span>")
									.fadeIn()
									.fadeOut(
											1000,
											function() {
												$(this).remove();
											});
									window
									.setTimeout(
											function() {
												location.reload()
											}, 500)
								},
								error : function(err) {
									alert(err);
									$("#msgdt")
									.html(
									"<span style='color: red'>Cập nhật thất bại!</span>")
									.fadeIn()
									.fadeOut(
											1000,
											function() {
												$(
														this)
														.remove();
											});
								}
						});
					});
			
			
			$(document).delegate('.delete', 'click', function () {
				if (confirm('Xác nhận xoá sản phẩm này?')) {
					var id = $(this).attr('id');
					var parent = $(this).parent().parent();
					$.ajax({
						type: "DELETE",
						url: "/api/v1/admin/product/" + id + "/detail",
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

function previewImages() {

	var preview = document.querySelector('#previewonly');

	if (this.files) {
		[].forEach.call(this.files, readAndPreview);
	}

	function readAndPreview(file) {

		// Make sure `file.name` matches our extensions criteria
		if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
			return alert(file.name + " is not an image");
		} // else...

		var reader = new FileReader();

		reader.addEventListener("load", function() {
			var image = new Image();
			image.height = 100;
			image.margin = 5;
			image.title = file.name;
			image.src = this.result;
			preview.appendChild(image);
		});

		reader.readAsDataURL(file);

	}

}

document.querySelector('#file-input').addEventListener("change", previewImages);
