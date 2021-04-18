(function ($) {
  "use strict";

  $.fn.JPaging = function () {

    var $pageSize = 5; // số phần tử xuất hiện

    var $visiblePageSize = 5; // số paging xuất hiện

    var $parentTag = 'ul';
    // ParentsTag có id rồi khỏi lo
    var $itemTag = 'li';
    // Nếu itemTag dùng div phải kèm class để phân biệt các itemTag và các div thông thường

    var isReversed = true;

    var $thisId = $(this).attr("id");


    $("<div id='paging'></div>").insertAfter(this); // chèn list Paging




    var $countLi = $(this).find($itemTag).length; // đếm số thẻ li trong phần đc paging

    if (isReversed) {
      // var items = $(this).getElementsByTagName("li");
      // var reverseItems = []
      // console.log(items)
      // var i = $countLi - 1;
      // while (i--)
      //   reverseItems.appendChild(items.childNodes[i]);

      // $(this).empty();
      // $(this).append(reverseItems);
      //
      //TODO: Reverse
    }


    var $currentIndex = 1;
    var $pageCount = Math.floor($countLi / $pageSize);
    if ($pageCount * $pageSize < $countLi) {
      $pageCount++;
    }


    //Add list paging vào #paging
    if ($pageCount >= 1 && $visiblePageSize >= 1) {
      $("#paging").append(
        "<a href='javascript:void(0)' style='font-weight:700;'>" + "<" + "</a>"
      );
      if ($pageCount > $visiblePageSize) { // Nếu số trang vượt quá số paging hiển thị
        $("#paging").append(
          "<a href='javascript:void(0)' id='pre_point' class='hidden'>" + "..."
        );
      }

      for (var i = 1; i <= $pageCount; i++) {
        if (i <= $visiblePageSize) {
          $("#paging").append("<a href='javascript:void(0)'>" + i + "</a>");
        } else if (i > $visiblePageSize) {
          $("#paging").append(
            "<a href='javascript:void(0)' class='hidden'>" + i + "</a>"
          );
        }
      }

      if ($pageCount > $visiblePageSize) {
        $("#paging").append(
          "<a href='javascript:void(0)' id='next_point'>" + "..."
        );
      }
      $("#paging").append(
        "<a href='javascript:void(0)' style='font-weight:700;'>" + ">" + "</a>"
      );

      // Ẩn các phần tử từ vị trí thứ pagesize-1(List bắt đầu từ 0)
      $($parentTag + "#" + $thisId + " " + $itemTag + ":gt(" + ($pageSize - 1) + ")").hide();
      //demo: $("ul#listComment li:gt(2)").hide() 

      if ($pageCount > $visiblePageSize) {
        $currentIndex = $currentIndex + 1;
      }

      // lấy phần tử $currentIndex và chèn vào phần tử đó class aktif
      //ex: <li class="hehe hihi">ái chà chà</li>
      $("#paging a:eq(" + $currentIndex + ")").addClass("aktif");
    }

    // bắt sự kiện click #pre_point(Nút đầu tiên có dấu ... Vd: < 1 ... 1 2 3 ... 50 >)
    $("#pre_point").on("click", function (event) {
      event.preventDefault();
      var prevIndex = $(this)
        .nextAll("a:not('.hidden,#next_point')")
        .first()
        .index(); // lấy index của phần tử đầu tiên tiếp theo cùng tag ngoại trừ .hidden, #next_point
      // ko tìm thấy trả về -1...Mà trong trường hợp này chắc chắn có giá trị

      var hideIndex = prevIndex + $visiblePageSize - 1;
      $("#paging a:eq(" + hideIndex + ")").addClass("hidden"); // ẩn paging cuối cùng có thể nhìn
      $("#paging a").removeClass("aktif"); // xoá thẻ có class aktif
      $("#paging a:eq(" + (prevIndex - 1) + ")")
        .removeClass("hidden")
        .addClass("aktif"); // tạo thẻ có aktif cho phần tử trước prevIndex


      $currentIndex = prevIndex - 1;
      var gt = $pageSize * ($currentIndex - 1);
      $($parentTag + "#" + $thisId + " " + $itemTag).hide(); // ẩn tất cả item
      //demo: $("ul#listComment li").hide() 

      // Hiển thị các item từ gt-pagesize đến gt-1
      for (var i = gt - $pageSize; i < gt; i++) {
        $($parentTag + "#" + $thisId + " " + $itemTag + ":eq(" + i + ")").show();
      }
      if ($currentIndex - 1 == $pageCount && $visiblePageSize < $pageCount) {
        $("#next_point").addClass("hidden");
      } else if (
        $currentIndex < $pageCount + $visiblePageSize &&
        $visiblePageSize < $pageCount
      ) {
        $("#next_point").removeClass("hidden");
      }
      if ($currentIndex > 2 && $visiblePageSize < $pageCount) {
        $("#pre_point").removeClass("hidden");
      } else if ($currentIndex <= 2 && $visiblePageSize < $pageCount) {
        $("#pre_point").addClass("hidden");
      }
    });


    $("#next_point").on("click", function (event) {
      event.preventDefault();
      var prevIndex = $(this)
        .prevAll("a:not('.hidden')")
        .first()
        .index();
      console.log("prevIndex:" + prevIndex);
      var hideIndex = prevIndex - $visiblePageSize + 1;
      $("#paging a:eq(" + hideIndex + ")").addClass("hidden");
      $("#paging a").removeClass("aktif");
      $("#paging a:eq(" + (prevIndex + 1) + ")")
        .removeClass("hidden")
        .addClass("aktif");
      $currentIndex = prevIndex;
      var gt = $pageSize * $currentIndex;
      $($parentTag + "#" + $thisId + " " + $itemTag).hide();
      for (var i = gt - $pageSize; i < gt; i++) {
        $($parentTag + "#" + $thisId + " " + $itemTag + ":eq(" + i + ")").show();
      }
      if ($currentIndex == $pageCount && $visiblePageSize < $pageCount) {
        $("#next_point").addClass("hidden");
      } else if ($currentIndex < $pageCount && $visiblePageSize < $pageCount) {
        $("#next_point").removeClass("hidden");
      }
      if ($currentIndex > $visiblePageSize && $visiblePageSize < $pageCount) {
        $("#pre_point").removeClass("hidden");
      } else if (
        $currentIndex < $visiblePageSize &&
        $visiblePageSize < $pageCount
      ) {
        $("#pre_point").addClass("hidden");
      }
    });


    $("#paging").on("click", "a:not('#pre_point,#next_point')", function () {
      var $index = $(this).index();
      console.log(
        "curindex:" +
        $currentIndex +
        " visible_page_count:" +
        $visiblePageSize +
        " pageCount:" +
        $pageCount
      );
      if ($(this).is("#paging a:first") === true) {
        if ($currentIndex === 2 && $pageCount > $visiblePageSize) {
          return false; // chặn ko cho lùi tiếp
        }
        if ($currentIndex === 1) { // chặn ko cho lùi tiếp
          return false;
        }
        if ($currentIndex - 2 == $pageCount && $pageCount > $visiblePageSize) {
          $("#next_point").addClass("hidden");
        } else if (
          $currentIndex - 2 <= $pageCount - $visiblePageSize &&
          $pageCount > $visiblePageSize
        ) {
          $("#next_point").removeClass("hidden");
        }
        if ($currentIndex - 1 > 2 && $pageCount > $visiblePageSize) {
          $("#pre_point").removeClass("hidden");
        } else if ($currentIndex - 1 <= 2 && $pageCount > $visiblePageSize) {
          $("#pre_point").addClass("hidden");
        }
        $currentIndex = $currentIndex - 1;
        var gtFirst = $pageSize * ($currentIndex - 1);
        if ($pageCount <= $visiblePageSize) gtFirst = $pageSize * $currentIndex;
        $("#paging a").removeClass("aktif");
        $("#paging a:not('#next_point'):eq(" + $currentIndex + ")").addClass(
          "aktif"
        );
        $("#paging a:not('#next_point'):eq(" + $currentIndex + ")").removeClass(
          "hidden"
        );
        if ($("#paging a.hidden").length >= 1) {
          $(
            "#paging a:not('#next_point,#paging a:last'):eq(" +
            ($currentIndex + $visiblePageSize) +
            ")"
          ).addClass("hidden");
        }
        $($parentTag + "#" + $thisId + " " + $itemTag).hide();
        for (var f = gtFirst - $pageSize; f < gtFirst; f++) {
          $($parentTag + "#" + $thisId + " " + $itemTag + ":eq(" + f + ")").show();
        }
        console.log(
          "end curindex:" +
          $currentIndex +
          " visible_page_count:" +
          $visiblePageSize +
          " pageCount:" +
          $pageCount
        );
        return false;
      }

      if ($(this).is("#paging a:last") === true) {
        if ($currentIndex - 1 === $pageCount && $pageCount > $visiblePageSize) {
          return false;
        }
        if ($currentIndex === $pageCount && $pageCount <= $visiblePageSize) {
          return false;
        }
        if ($currentIndex == $pageCount && $visiblePageSize < $pageCount) {
          $("#next_point").addClass("hidden");
        } else if (
          $currentIndex < $pageCount &&
          $visiblePageSize < $pageCount
        ) {
          $("#next_point").removeClass("hidden");
        }
        if ($currentIndex > $visiblePageSize && $visiblePageSize < $pageCount) {
          $("#pre_point").removeClass("hidden");
        } else if (
          $currentIndex < $visiblePageSize &&
          $visiblePageSize < $pageCount
        ) {
          $("#pre_point").addClass("hidden");
        }
        $currentIndex = $currentIndex + 1;
        var gtLast = $pageSize * ($currentIndex - 1);
        if ($pageCount <= $visiblePageSize) gtLast = $pageSize * $currentIndex;
        $("#paging a").removeClass("aktif");
        $("#paging a:eq(" + $currentIndex + ")").addClass("aktif");
        $("#paging a:eq(" + $currentIndex + ")").removeClass("hidden");
        if (
          $currentIndex - 1 > $visiblePageSize &&
          $("#paging a.hidden").length >= 1
        ) {
          console.log("cc" + ($currentIndex - $visiblePageSize));
          $(
            "#paging a:not('#next_point,#paging a:last'):eq(" +
            ($currentIndex - $visiblePageSize) +
            ")"
          ).addClass("hidden");
        }
        $($parentTag + "#" + $thisId + " " + $itemTag).hide();
        for (var k = gtLast - $pageSize; k < gtLast; k++) {
          $($parentTag + "#" + $thisId + " " + $itemTag + ":eq(" + k + ")").show();
        }
        return false;
      }

      $currentIndex = $index - 1;
      var gt = $pageSize * $currentIndex;
      if ($pageCount <= $visiblePageSize) gt = $pageSize * ($currentIndex + 1);
      $("#paging a").removeClass("aktif");
      $(this).addClass("aktif");
      $($parentTag + "#" + $thisId + " " + $itemTag).hide();
      for (var i = gt - $pageSize; i < gt; i++) {
        $($parentTag + "#" + $thisId + " " + $itemTag + ":eq(" + i + ")").show();
      }
    });
  };
})(jQuery);
