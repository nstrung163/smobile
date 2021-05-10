/** Toggle Class form rate */
$('.box-qa__rate__show-form').on('click', function() {
	$('.box-qa__comment').toggleClass('d-none');
	if($('.box-qa__comment').hasClass('d-none')) {
		$('.btn-send-rate').text('Gửi đánh giá của bạn');
	} else {
		$('.btn-send-rate').text('Đóng');
	}
})

$('.rating label').on('click', function ()
{
    var labelSelected = $(this).attr("for");
    alert($(this).attr("for"))
    $('.rating').find('input[name=rating]').each(function ()
    {
        if ($(this).attr("id") == labelSelected)
        {
            console.log($(this).val());
            return false;
        }
    })
})
