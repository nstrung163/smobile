$(document).ready(function() {
	
	// Add "active" class for link in Header
	var pathName = window.location.pathname;
	$("header .nav-link").each(function() {
		$this = $(this);
		if (pathName.includes($this.attr("href"))) {
			$this.parent().addClass("active");
		}
	});

	// Upload image preview
	$('input.upload-image').on('change', function() {
		var url = window.URL || window.webkitURL;
		var file = this.files[0];
		var fileUrl;
		var $parent = $(this).parent();
		if (file) {
			fileUrl = url.createObjectURL(file);
		} else {
			var oldImagePath = $parent.find(".old-img").val();
			if (oldImagePath) {
				fileUrl = oldImagePath;
			} else {
				fileUrl = "/images/image-demo.png";
			}
		}
		$parent.find('.preview-image-upload img').attr('src', fileUrl);
	});
});

/**
 * Validate Form
 *
 * @param $formElement
 * @param validationInfo
 * @returns true if form is valid
 */
function formValidate($formElement, validationInfo) {

	$formElement.validate({
		rules: validationInfo.rules,
		messages: validationInfo.errorMessages,
		errorElement: "div",
		errorClass: "error-message-invalid",
		ignore: 'input[type=hidden], .select2-input, .select2-focusser'
	});
	return $formElement.valid();
}
