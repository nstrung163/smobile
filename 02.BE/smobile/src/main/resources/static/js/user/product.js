$(document).ready(function() {
	/* Border for tag "li" on click*/
	$('.check').change(function() {
		$(this).parent().toggleClass("li-enable");
	})

	/* Show more and hidden logo brand */
	var max = 9;
	$('ul, li').each(function() {
		$(this).find('li').each(function(index) {
			if (index >= max) {
				$(this).hide();
			}
		})
	})
	$('.hidden-item').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').addClass("d-none");
		$('.show-more').removeClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				if (index >= max) {
					$(this).hide(1000);
				}
			})
		})
	})
	$('.show-more').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').removeClass("d-none");
		$('.show-more').addClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				$(this).show(1000);
			})
		})
	})

});

/*Get list brandId*/
var listBrandArr = [];
$(".check").on('click', function() {
	listBrandArr = [];
	$('.listBrand').find('input[name="brand.logo"]:checked').each(function() {
		listBrandArr.push($(this).val());
	});
	console.log(`Value of array: ${listBrandArr.length}`)
})
