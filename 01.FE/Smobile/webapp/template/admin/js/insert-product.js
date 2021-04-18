/*$(document).ready(function () {

	$(document).delegate('#addNew', 'click', function (event) {
		event.preventDefault();

		var control = "product";
		var productName = $('#productName').val();
		var categoryId = $('#categoryId').val();
		var brandId = $("#brandId").val();
		var description = $("#description").val();
		var price = $('#price').val();
		var salePrice = $('#salePrice').val();
		var status = $("#status").val();
		if ($("form").valid()) {
			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "/api/v1/admin/" + control,
				data: JSON.stringify(
					{
						'productName': productName,
						'categoryId': categoryId,
						'brandId': brandId,
						'description': description,
						'price': price,
						'salePrice': salePrice,
						'status': status
					}
				),
				cache: false,
				success: function (result) {
					$("#msg").html("<span style='color: green'>Tạo mới thành công!</span>").fadeIn().fadeOut(3000, function () {
						$(this).remove();
					});
					window.setTimeout(function () { location.reload() }, 1000)
				},
				error: function (err) {
					$("#msg").html("<span style='color: red'>Tạo mới thất bại!</span>").fadeIn().fadeOut(3000, function () {
						$(this).remove();
					});
				}
			});
		}
	});
});*/



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
	      image.title  = file.name;
	      image.src    = this.result;
	      preview.appendChild(image);
	    });
	    
	    reader.readAsDataURL(file);
	    
	  }

	}

	document.querySelector('#file-input').addEventListener("change", previewImages);
