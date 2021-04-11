/**Choose Province */
$(document).ready(function () {
  $(".province__option").click(function () {
    $(".modal").css("display", "flex");

  });
  /**Modal */
  $(".btn-close").click(function () {
    $(".modal").css("display", "none");
    $(".btn-close").css("outline", "none");
    $(".btn-close").css("border", "0");
  });
  /**Group promotion*/
  $(".group-promo-tabs .nav-tab-item .nav-link").on("click", function (e) {
    e.preventDefault();
    var $paren = $(this).parent();
    if (!$paren.hasClass("active")) {
      $paren.siblings().removeClass("active");
      $paren.addClass("active");
      var tabContentId = $(this).attr("href");
      $(tabContentId).siblings().removeClass("active");
      $(tabContentId).addClass("active");
    }
  });
  /**Modal overlay video list cate */

  var $videoPlayer = $(".video-player-modal .video-player-body .video-player");
  $(".btn-play-video").click(function (e) {
    e.preventDefault();
    let youtubeUrl = $(this).data("youtube-url");
    if (youtubeUrl) {
      $videoPlayer.empty();
      $videoPlayer.append(
        "<iframe width='100%' height='100%' src='" +
          youtubeUrl +
          "' frameborder='0' allowfullscreen=''></iframe>"
      );
      $(".video-player-modal").removeClass("d-none");
    }
  });

  $(".video-player-modal").on("click", ".close-btn", function () {
    $(".video-player-modal").addClass("d-none");
    $videoPlayer.empty();
  });

  $("body").on(
    "click",
    ".video-player-modal:not(.video-player-body), .video-player-modal:not(.video-player)",
    function () {
      $(".video-player-modal").addClass("d-none");
      $videoPlayer.empty();
    }
  );
  /**Show more footer */
  $(".showMore").click(function () {
    $(".col-hidden").css("display", "block");
    $(".showMore").css("display", "none");
  });
  $(".showMore-2").click(function () {
    $(".col-hidden-2").css("display", "block");
    $(".showMore-2").css("display", "none");
  });
  /**Scroll to top */
  $(window).scroll(function () {
    if ($(this).scrollTop()) {
      $("#goto-top").fadeIn();
    } else {
      $("#goto-top").fadeOut();
    }
  });
  $("#goto-top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 1000);
  });
});

/**Carousel */
// $(".carousel").carousel({
//   interval: 1000 * 5,
// });
