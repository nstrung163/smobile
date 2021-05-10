<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Smobile | Sản phẩm</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/reset.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/base.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/user/product.css'/>"rel="stylesheet" />
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
              <li class="nav-item active">
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
    <main class="container">
       <!-- Banner  -->
      <section class="container-fluid mixed-area">
        <section class="row branner-carousel">
          <div class="carousel-sale">
            <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="d-block w-100" src="/images/product/product-caroulse1.png"/>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="/images/product/product-caroulse2.png" />
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="/images/product/product-caroulse3.png"/>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="/images/product/product-caroulse4.png"/>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="/images/product/product-caroulse5.png"/>
                  </div>
              </div>
              <a class="carousel-control-prev" href="#myCarousel" role="button"  data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
          <div class="hotnew">
            <div class="experience-video">
            <div class="img-sale">
              <img src="/images/news/tin-tuc1.png"/>
              <img src="/images/news/tin-tuc2.png"/>
            </div>
          </div>
        </section>
      </section> 

      <!-- Search area -->
      <div class="search-area">
        <div class="searchByBrand">
          <ul class="listBrand">
			<c:forEach var="brand" items="${ listBrand }">
				<li class="list-brand__item" data-name="${ brand.brandName }" data-id="${ brand.brandId }">
					<input class="check" id="${ brand.brandId }" type="checkbox" value="${ brand.brandId }" name="brand.logo">
					<label class="label-item" for="${ brand.brandId }"><img class="logo-brand" alt="Logo Brand" src="/${ brand.logo }"></label>
				</li>
			</c:forEach>
				<span class="show-more">Xem thêm<i class="icon fas fa-caret-down"></i></span>
				<span class="hidden-item d-none">Ẩn bớt<i class="icon-up fas fa-sort-up"></i></span>
			</ul>
        </div>
		<!-- Choose price -->
        <div class="search-product ">
          <span class="search-product-master">Chọn mức giá:</span>
          <div class="search-product__price">
          	<ul class="search-product-list">
              <li class="search-product--item"><a href="/" class="search-product--link" data-id="5">Dưới 5 triệu</a></li>
              <li class="search-product--item"><a href="/" class="search-product--link" data-id="5-10">Từ 5 - 10 triệu</a></li>
              <li class="search-product--item"><a href="/" class="search-product--link" data-id="10-15">Từ 10 - 15 triệu</a></li>
              <li class="search-product--item"><a href="/" class="search-product--link" data-id="15-20">Từ 15 - 20 triệu</a></li>
              <li class="search-product--item"><a href="/" class="search-product--link" data-id=">20">Trên 20 triệu</a></li>
            </ul>
          </div>
      	<!-- Filter -->
          <div class="filter-area">
            <div class="filter-box">
              <div class="filter-box__title">Bộ lọc<i class="icon fas fa-caret-down"></i></div>
              <div class="list-filter d-none">
                <ul class="list-filter__type-phone">
                  <li  class="list-filter--title">Loại điện thoại</li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--type-product" data-id="iPhone"><i class="icon-checkbox"></i>iPhone(iOS)</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--type-product" data-id="Android"><i class="icon-checkbox"></i>Android</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--type-product" data-id="Điện thoại phổ thông"><i class="icon-checkbox"></i>Điện thoại phổ thông</a>
                  </li>
                </ul>
                <ul class="list-filter__ram">
                  <li class="list-filter--title">Dung lượng RAM</li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--ram" data-id="duoi-4g"><i class="icon-checkbox"></i>Dưới 4 GB</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--ram" data-id="4gb-6gb"><i class="icon-checkbox"></i>4 - 6 GB</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--ram" data-id="tren-8gb"><i class="icon-checkbox"></i>8 GB trở lên</a>
                  </li>
                </ul>
                <ul class="list-filter__pin">
                  <li class="list-filter--title">Dung lượng PIN</li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--pin" data-id="duoi-3000"><i class="icon-checkbox"></i>Dưới 3000 mAh</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--pin" data-id="tu-3000-4000"><i class="icon-checkbox"></i>Từ 3000 - 4000 mAh</a>
                  </li>
                  <li class="list-filter--item">
                    <a href="/" class="list-filter--link list-filter--pin" data-id="tren-4000mah"><i class="icon-checkbox">Siêu trâu: trên 4000 mAh</i></a>
                  </li>
                </ul>
                <div class="btn-close-filter"></div>
              </div>
            </div>
            <div class="sort-box">
              <span class="sort-box__title">Sắp xếp theo:
                  <div class="sort-area">
                    <a href="/" class="sort-area--link sort-area__sort-asc" data-id="cao-den-thap"><i class="fas fa-sort-amount-down"></i>Giá cao</a>
                    <a href="/" class="sort-area--link sort-area__sort-desc" data-id="thap-den-cao"><i class="fas fa-sort-amount-up"></i>Giá thấp</a>
                    <a href="/" class="sort-area--link sort-area__sort-highlight check-sort" data-id="not-bat"><i class="fas fa-star"></i>Nổi bật</a>
                  </div>
              </span>                     
            </div>
          </div>
          <!-- Button search -->
          <div class="btn-search">
            <button type="submit" id="btnSubmitSearch" class="btn btn-success"><i class="fas fa-search"></i></button>
          </div>
        </div>
        <div class="condition-search-box">
          <ul class="condition-search__list">
            <li class="condition-search--item"><a href="/" class="condition-search--link" data-id="iphone">iPhone(Apple)<i class="btn-close-condition"></i></a></li>
            <li class="condition-search--item"><a href="/" class="condition-search--link">Từ 10 - 15 triệu<i class="btn-close-condition"></i></a></li>
            <li class="condition-search--item"><a href="/" class="condition-search--link">Dưới 4 GB<i class="btn-close-condition"></i></a></li>
          </ul>
          <div class="btn-delete-all-box">
          	<span class="condition-search--item btn-delete-all">
          		<a href="/" class="condition-search--link">
          			Xóa tất cả<i class="btn-close-condition"></i>
          		</a>
          	</span>
          </div>
        </div>
      </div>
      <!-- Condition box -->
      <section class="container-fluid outstanding-phone">
        <div class="outstanding-phone__header">
          <div class="title-outstanding">Danh sách sản phẩm</div>
        </div>
        <div class="tab-content">
          <div class="tab-product">
            <ul class="list-promotion">
              <!-- Product 2 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 1.000.000 ₫</span>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                  </p>
                  <strong class="product-price-new">6.990.000₫</strong>
                  <span class="product-price-old"> 7.990.000₫</span>
                  <span class="percent-sale">(-15%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>2.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">11 đánh giá</span>
                </div>
              </li>
              <!-- Product 3 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc3.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 4.000.000 ₫</span>
                  </div>
                  <p class="product-name">IPhone 12 Pro Max 256GB
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">29.990.000₫</strong>
                  <span class="product-price-old">33.990.000₫</span>
                  <span class="percent-sale">(-26%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.8</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">24 đánh giá</span>
                </div>
              </li>
              <!-- Product 4 -->
              <li class="product-promo--item">
                <a href="/" data-holder-rendered="true">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc4.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 2.000.000 ₫</span>
                  </div>
                  <p class="product-name">Samsung Galaxy A02</p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old">7.990.000₫</span>
                  <span class="percent-sale">(-18%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.8</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">156 đánh giá</span>
                </div>
              </li>
              <!-- Product 5 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/product/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                      <span>Giảm 1.000.000 ₫</span>
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000₫</span>
                  <span class="percent-sale">(-14%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>4.2</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">70 đánh giá</span>
                </div>
              </li>
               <!-- Product 2 -->
               <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 1.000.000 ₫</span>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                  </p>
                  <strong class="product-price-new">6.990.000₫</strong>
                  <span class="product-price-old"> 7.990.000₫</span>
                  <span class="percent-sale">(-15%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>2.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">11 đánh giá</span>
                </div>
              </li>
              <!-- Product 3 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc3.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 4.000.000 ₫</span>
                  </div>
                  <p class="product-name">IPhone 12 Pro Max 256GB
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">29.990.000₫</strong>
                  <span class="product-price-old">33.990.000₫</span>
                  <span class="percent-sale">(-26%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.8</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">24 đánh giá</span>
                </div>
              </li>
              <!-- Product 4 -->
              <li class="product-promo--item">
                <a href="/" data-holder-rendered="true">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc4.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                    <span>Giảm 2.000.000 ₫</span>
                  </div>
                  <p class="product-name">Samsung Galaxy A02</p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old">7.990.000₫</span>
                  <span class="percent-sale">(-18%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.8</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">156 đánh giá</span>
                </div>
              </li>
              <!-- Product 5 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/product/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="price-discount">
                      <span>Giảm 1.000.000 ₫</span>
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000₫</span>
                  <span class="percent-sale">(-14%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>4.2</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">70 đánh giá</span>
                </div>
              </li>
              <!-- Product 1 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/product/gstc5.jpg" alt=""/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">Xiaomi Redmi 9T(4GB/64GB)</p>
                  <strong class="product-price-new">9.690.000₫</strong>
                  <span class="product-price-old">12.400.000₫ </span>
                  <span class="percent-sale">(-22%)</span>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">77 đánh giá</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
       <div class="d-flex justify-content-center">
		   <ul class="pagination"></ul>
		</div>
	   <div id="resultSearch">
        <p></p>
      </div>
      </section>
      <!-- Viewed Product  -->
      <section class="product-viewed-area">
        <div class="product-viewed__header">
          <div class="title-product-viewed">Sản phẩm đã xem</div>
        </div>
        <div class="tab-content">
          <div class="tab-product active">
            <ul class="list-promotion">
                <!-- Product 1 -->
                <li class="product-promo--item">
                  <a href="/pages/user/product-detail.html">
                    <div class="img-container">
                      <span class="tra-gop">Trả góp 0%</span>
                      <img class="product-promo--item-img" src="/images/product/gstc5.jpg" alt=""/>
                    </div>
                    <div class="img-label">
                      <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                    </div>
                    <p class="product-name">Xiaomi Redmi 9T(4GB/64GB)</p>
                    <strong class="product-price-new">9.690.000₫</strong>
                    <span class="product-price-old">12.400.000₫ </span>
                    <span class="percent-sale">(-22%)</span>
                  </a>
                  <div class="rating">
                    <span class="rating__start">
                      <b>3.9</b>/5
                      <i class="fas fa-star"></i>
                    </span>
                    <span class="sl-rating">77 đánh giá</span>
                  </div>
                </li>
                <!-- Product 2 -->
                <li class="product-promo--item">
                  <a href="/">
                    <div class="img-container">
                      <span class="tra-gop">Trả góp 0%</span>
                      <img class="product-promo--item-img" src="/images/product/gstc2.jpg" data-holder-rendered="true"/>
                    </div>
                    <div class="price-discount">
                      <span>Giảm 1.000.000 ₫</span>
                    </div>
                    <p class="product-name">
                      Xiami Redmi Note 10 Pro MFF
                    </p>
                    <strong class="product-price-new">6.990.000₫</strong>
                    <span class="product-price-old"> 7.990.000₫</span>
                    <span class="percent-sale">(-15%)</span>
                  </a>
                  <div class="rating">
                    <span class="rating__start">
                      <b>2.9</b>/5
                      <i class="fas fa-star"></i>
                    </span>
                    <span class="sl-rating">11 đánh giá</span>
                  </div>
                </li>
                <!-- Product 3 -->
                <li class="product-promo--item">
                  <a href="/">
                    <div class="img-container">
                      <span class="tra-gop">Trả góp 0%</span>
                      <img class="product-promo--item-img" src="/images/product/gstc3.jpg" alt="" data-holder-rendered="true"/>
                    </div>
                    <div class="price-discount">
                      <span>Giảm 4.000.000 ₫</span>
                    </div>
                    <p class="product-name">IPhone 12 Pro Max 256GB
                      <span class="new-2020">Mới 2020</span>
                    </p>
                    <strong class="product-price-new">29.990.000₫</strong>
                    <span class="product-price-old">33.990.000₫</span>
                    <span class="percent-sale">(-26%)</span>
                  </a>
                  <div class="rating">
                    <span class="rating__start">
                      <b>3.8</b>/5
                      <i class="fas fa-star"></i>
                    </span>
                    <span class="sl-rating">24 đánh giá</span>
                  </div>
                </li>
            </ul>
          </div>
        </div>
      </section>
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
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
	<script src="<c:url value='/js/base.js'/>"></script>
	<script src="<c:url value='/js/user/product.js'/>"></script>
  </body>
</html>