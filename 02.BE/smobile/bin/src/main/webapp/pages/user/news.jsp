<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Smobile | Tin tức</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/reset.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/base.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/user/news.css'/>" rel="stylesheet">
  </head>
  <body class="d-flex flex-column h-100">
    <header>
      <div class="container">
        <div class="container-fluid">
          <div class="row header-content">
            <div class="header-left">
                <a href="/home" class="logo"></a>
            </div>
            <div class="search">
                <input type="text" class="search__input" placeholder="Bạn tìm gì..."/>
                <a href="/user/search" class="search__item"></a>
            </div>
            <div class="header-right">
                <a href="/user/history-buy" id="history-buy">Lịch sử mua hàng</a>
                <a href="/user/cart" id="cart-box">
                	<span class="quantity-product">
                		<c:choose>
		                	<c:when test="${ sessionScope.totalItem == null}">0</c:when>
		                	<c:otherwise>${ sessionScope.totalItem}</c:otherwise>
		                </c:choose>
                	</span>
                </a>
                <sec:authentication var="user" property="principal"/>
                <sec:authorize access="!isAuthenticated()">
                	<a href="/login" class="sign-up-btn"><i class="fas fa-sign-in-alt"></i> Đăng nhập/Đăng ký</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                	<div class="user-menu">
	                	<a href="/" class="user-menu__name">Xin chào:&nbsp${ user.fullName }</a>
	                	<a href="/logout" class="user-menu--logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                	</div>
                </sec:authorize> 
                <a href="tel:18001999" class="switchboard">1800.1999<span>Tổng đài miễm phí</span>
                </a>
            </div>
          </div>
        </div>
      </div>
    </header>
    <div class="nav-bar-menu">
      <div class="container ">
        <nav class="navbar navbar-expand-lg navbar-light bg-nav">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto navbar-nav-list">
              <li class="nav-item">
                <a class="nav-link" href="/home"><i class="icon-nav fas fa-home"></i>TRANG CHỦ<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/user/product"><i class=" icon-nav fas fa-mobile-alt"></i>SẢN PHẨM</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="/user/news"><i class="icon-nav far fa-newspaper"></i>TIN TỨC </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/user/contact-us"><i class="icon-nav fas fa-phone-square"></i>LIÊN HỆ</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </div>
    <main class="container">
      <section class="container-fluid">
      <!-- Top news -->
      <div class="row">
        <div class="top-news">
            <div class="top-news__left">
                <a href="#"><img src="/images/news/top-news.jpg" alt="" class="top-news__left--image"></a>
                <h1 class="top-news__left--title"><a href="#">Ngày này cũng đến: Xiaomi Mi 11 Lite chính thức mở bán với hotsale đã hết cỡ, cơ hội sở hữu máy xịn với giá tiết kiệm đây</a></h1>
                <div class="top-news__left--content"> 
                    Không để các bạn đợi lâu thêm nữa, Mi 11 Lite 4G đã chính thức mở bán tại Thế Giới Di Động, kèm theo đó là hotsale cực kì hấp dẫn. Nếu như bạn vẫn chưa biết gì về chiếc smartphone mới toanh này của nhà Xiaomi, thì hãy cùng mình tham khảo ở ngay bên dưới.
                </div>
                <div class="top-news__left--date">1 ngày trước</div>
            </div>
            <div class="top-news__right">
                <div class="top-news__right--first-content">
                    <a href="#"><img src="/images/news/top-news-right.jpg" alt="" class="top-news__left--image"></a>
                    <h1 class="top-news__left--title"><a href="#">Tất Tần Tật: Những gì cần biết về Xiaomi Redmi Note 10 và Redmi Note 10 Pro - Bộ đôi smartphone tầm trung cực kỳ đáng giá</a></h1>
                    <div class="top-news__left--date">2 ngày trước</div>
                </div>
                <ul class="top-news__right--list">
                    <li class="top-news__right--item">
                        <a href="#">
                            <span class="top-news__right-content-hot">
                            Hướng dẫn cách cập nhật iOS 14.5 chính thức, nhiều tính năng mới đang chờ bạn khám phá
                            </span>
                        </a>
                    </li>
                    <li class="top-news__right--item">
                        <a href="#">
                            <span class="top-news__right-content-hot">
                            iOS 14.5 chính thức phát hành: Thêm tính năng mở khoá khi đeo khẩu trang, hỗ trợ 5G tại Việt Nam và ti tỉ cải tiến đáng giá
                            </span>
                        </a>
                    </li>
                    <li class="top-news__right--item">
                        <a href="#">
                            <span class="top-news__right-content-hot">
                            Galaxy M42 5G cực đáng mua với giá chỉ 7.8 triệu, có ngay Snapdragon 750G và viên pin 6.000mAh, chờ mua 'em nó' thôi
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
      </div>
      </section> 
      <!-- List news -->
      <section class="container-fluid">
        <div class="row">
            <ul class="list-view">
                <li class="list-view__item">
                    <a href="#" class="list-view__item--link">
                        <div class="list-view__item__left">
                            <img src="/images/news/viettel.jpg" class="list-view__item__left--img" alt="">
                        </div> 
                        <div class="list-view__item__right">
                            <h1 class="list-view__item__right--title">
                                Viettel khai trương thêm mạng 5G cho một tỉnh tại miền Trung, hỗ trợ cho các phiên bản iPhone 12
                            </h1>
                            <div class="list-view__item__right--author">
                                <span>Khắc Ngọc</span>
                                <span>1 Ngày trước</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="list-view__item">
                    <a href="#" class="list-view__item--link">
                        <div class="list-view__item__left">
                            <img src="/images/news/galaxyA52.jpg" class="list-view__item__left--img" alt="">
                        </div> 
                        <div class="list-view__item__right">
                            <h1 class="list-view__item__right--title">
                                Galaxy A52 được cập nhật phần mềm mới: Bổ sung thêm nhiều tính năng xịn sò có trên dòng flagship Galaxy S21
                            </h1>
                            <div class="list-view__item__right--author">
                                <span>Vũ Ngọc</span>
                                <span>1 Ngày trước</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="list-view__item">
                    <a href="#" class="list-view__item--link">
                        <div class="list-view__item__left">
                            <img src="/images/news/nokia.jpg" class="list-view__item__left--img" alt="">
                        </div> 
                        <div class="list-view__item__right">
                            <h1 class="list-view__item__right--title">
                                Lướt web bằng điện thoại 'cục gạch' bạn có tin? Sắm liền 2 chiếc phone cũ hỗ trợ 4G này của Nokia, giá ưu đãi ngon hết sảy
                            </h1>
                            <div class="list-view__item__right--author">
                                <span>Khắc Ngọc</span>
                                <span>2 Ngày trước</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="list-view__item">
                    <a href="#" class="list-view__item--link">
                        <div class="list-view__item__left">
                            <img src="/images/news/ios.jpg" class="list-view__item__left--img" alt="">
                        </div> 
                        <div class="list-view__item__right">
                            <h1 class="list-view__item__right--title">
                                Đọ tốc độ iOS 14.5 so với iOS 14.4.2 trên các mẫu iPhone cũ, có sự khác biệt nào xảy ra hay không?
                            </h1>
                            <div class="list-view__item__right--author">
                                <span>Minh Trung</span>
                                <span>4 Ngày trước</span>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
      </section>
    </main>
    <footer class="container-fluid">
      <div class="footer">
        <div class="row-footer-1">
          <ul class="col-footer">
            <li class="col-footer-link title-col">Thông tin Smobile</li>
            <li><a href="#" class="col-footer-link">Cửa hàng mở cửa <small>(8:00 - 22:00)</small></a></li>
            <li><a href="/" class="col-footer-link">Giới thiệu công ty</a></li>
            <li><a href="/" class="col-footer-link">Liên hệ góp ý</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link ">Nội quy cửa hàng</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link">In hóa đơn điện tử</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link">Bán hàng doanh nghiệp</a></li>
            <p class="col-footer-link showMore">Xem thêm</p>
          </ul>
          <ul class="col-footer">
            <li class="col-footer-link title-col">Hỗ trợ khách hàng</li>
            <li><a href="/" class="col-footer-link">Tìm hiểu về mua trả góp</a></li>
            <li><a href="/" class="col-footer-link">Giao hàng</a></li>
            <li><a href="/" class="col-footer-link">Bảo hành, đổi trả</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link ">Tìm trung tâm bảo hành</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link">Chất lượng phục vụ</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link">Hướng dẫn trao thưởng</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link">Hướng dẫn mua hàng</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link">Chính sách khui hộp sản phẩm apple</a></li>
            <li class="col-hidden-2"><a href="/" class="col-footer-link">Xem bản mobile</a></li>
            <p class="col-footer-link showMore-2">Xem thêm</p>
          </ul>
          <ul class="col-footer">
            <li class="col-footer-link title-col">Tổng đài hỗ trợ (Gọi miễn phí)</li>
            <li><p class="col-footer-link">Mua hàng <a class="tel-phone" href="tel:1800.1061"> 1800.1061 </a> (7:30 - 22:00)</p></li>
            <li><p class="col-footer-link">Kỹ thuật <a class="tel-phone" href="tel:1800.1061"> 1800.1762 </a> (7:30 - 22:00)</p></li>
            <li><p class="col-footer-link">Bảo hành <a class="tel-phone" href="tel:1800.1061"> 1800.1066 </a> (8:00 - 21:00)</p></li>
            <li><p class="col-footer-link">Khiếu nại <a class="tel-phone" href="tel:1800.1061"> 1800.106 </a> (8:00 - 21:30)</p></li>
            <li class="li-list-icon"><i class="icondmx-btc"></i> <i class="icondmx-huychuong"></i> <i class="icondmx-dmca"></i></i></li>
          </ul>
          <ul class="col-footer">
              <li class="social">
                <a href="/" class="social__share"><i class="iconfb"></i> 15.6k fan </a>
                <a href="/" class="social__share"><i class="iconyt"></i>  5k đăng ký  </a>
              </li>
          </ul>
        </div>  
        <div class="row-footer-2">
          <p>© 2017. Công ty Smobile. GPDKKD: 0403547354 do sở KH & ĐT TP.HCM cấp ngày 02/01/2007. 
            GP số 57/GP-SMOBLIE do Sở TTTT TP HCM cấp ngày 30/07/2018. <br>
            Địa chỉ: 184 Đinh Tiên Hoàng, Thành Phố Huế. Điện thoại: (028)39.60.60. Email: cskh@smobile.com.
            <a href="/" >Xem chính sách sử dụng web</a>
          </p>
        </div>
      </div>
    </footer>
    <div id="goto-top">↑</div>
    <script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/base.js'/>"></script>
  </body>
</html>
