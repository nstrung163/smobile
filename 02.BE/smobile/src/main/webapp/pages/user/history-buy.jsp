<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Smobile | Lịch sử mua hàng</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="" rel="shortcut icon" type="image/x-icon"/>
	<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/reset.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/base.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/user/history-buy.css'/>"rel="stylesheet"/>
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
                <a href="/user/search" class="search__item" id="search-keyword"></a>
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
              <li class="nav-item ">
                <a class="nav-link" href="/home"><i class="icon-nav fas fa-home"></i>TRANG CHỦ<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/user/product"><i class=" icon-nav fas fa-mobile-alt"></i>SẢN PHẨM</a>
              </li>
              <li class="nav-item">
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
    <main class="container box-card-container">
        <div class="box-card__title">
          <div class="box-card__title__left"><a href="/" class="box-card__title--back--home">Tiếp tục tìm kiếm sản phẩm <i class="fas fa-chevron-right"></i></a></div>
          <div class="box-card__title__right"><h1>Lịch sử mua hàng của bạn</h1></div>
        </div>
         <sec:authorize access="!isAuthenticated()">
         	<div class="not-authenticated-area">
         		<p class="not-authenticated-area__title">Vui lòng đăng nhập để xem lịch sử mua hàng</p>
         		<a href="/login" role="button" class="btn btn-primary not-authenticated-area--btn">Đăng nhập</a>
         	</div>
         </sec:authorize>
         <sec:authorize access="isAuthenticated()">
         	<c:choose>
	        	<c:when test="${ listHistoryBuy.size() == 0 }">
	        		<p class="notification-empty-history">Lịch sử mua hàng của bạn đang trống</p>
	        	</c:when>
	        	<c:otherwise>
	        		<div class="main-content box-card">
			             <ul class="product-info__list">
			             	<c:forEach var="purchase" items="${ listHistoryBuy }">
				             	<li class="product-info__item">
				                       <div class="product-info__item__image">
				                           <img src="/${ purchase.imageUrl }" alt="${ purchase.productName }">
				                       </div>
				                       <div class="product-info__item__essential">
				                           <span class="product-info__item__name">${ purchase.productName } ${ purchase.colorProductName } ${ purchase.memoryProduct }GB</span>
				                           <span>Đơn giá: <span class="product-info__item__price"><fmt:formatNumber value="${ purchase.salePrice }" type="currency" minFractionDigits="0" currencySymbol=""/> ₫</span></span>
				                           <ul class="list-buy">
				                               <div class="list-buy__quantity">Số lượng: x${ purchase.quantity }</div>
				                               <li class="list-buy__item">Thành tiền: <span class="product-info__item__price"><fmt:formatNumber value="${ purchase.salePrice * purchase.quantity }" type="currency" minFractionDigits="0" currencySymbol=""/> ₫</span></li>
				                           </ul>
				                           <span> Ngày mua: <fmt:formatDate pattern="dd-MM-yyyy" value="${ purchase.dateOfOrder }" /></span>
				                           <span> Trạng thái đơn hàng: <span class="status_purchase">${ purchase.purchaseStatusName }</span> </span>
				                       </div>
				                   </li>
			             	</c:forEach>
			              </ul>
			          </div>
	        	</c:otherwise>
	        </c:choose>
         </sec:authorize>
      </main>
      <footer class="container-fluid">
        <div class="footer">
          <div class="row-footer-1">
            <ul class="col-footer">
              <li class="col-footer-link title-col">Thông tin Smobile</li>
              <li><a href="/" class="col-footer-link">Cửa hàng mở cửa <small>(8:00 - 22:00)</small></a></li>
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
	<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/base.js'/>"></script>
  </body>
</html>
