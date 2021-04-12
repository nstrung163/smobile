$(document).ready(function() {
    $(".local-nav .sup-menu").hover(function() {
        $(this).parent().find(".sub-menu").css("display", "flex");
    }, function() {
        $(this).parent().find(".sub-menu").css("display", "none");
    });


    $(".group-tabs .nav-tab-item .nav-link").on( "click", function(e) {
        e.preventDefault();
        var $parent = $(this).parent();
        if(!$parent.hasClass("active")) {
            $parent.siblings().removeClass("active");
            $parent.addClass("active");
            var tabContentId = $(this).attr("href");
            $(tabContentId).siblings().removeClass("active");
            $(tabContentId).addClass("active");
        }
    });

    var $videoPlayer = $(".video-player-modal .video-player-body .video-player");
    $('.btn-play-video').click(function (e) {
        e.preventDefault();
        let youtubeUrl = $(this).data("youtube-url");
        if (youtubeUrl) {
            $videoPlayer.empty();
            $videoPlayer.append("<iframe width='100%' height='100%' src='" + youtubeUrl + "' frameborder='0' allowfullscreen=''></iframe>");
            $(".video-player-modal").removeClass("d-none");
        }
    });

    $(".video-player-modal").on("click", ".close-btn", function () {
        $(".video-player-modal").addClass("d-none");
        $videoPlayer.empty();
    });
    $("body").on("click", ".video-player-modal:not(.video-player-body), .video-player-modal:not(.video-player)", function () {
        $(".video-player-modal").addClass("d-none");
        $videoPlayer.empty();
    });


    $(window).scroll(function() {
        if ($(this).scrollTop()) {
            $('#goto-top').fadeIn();
        } else {
            $('#goto-top').fadeOut();
        }
    });
    $("#goto-top").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
     });
});