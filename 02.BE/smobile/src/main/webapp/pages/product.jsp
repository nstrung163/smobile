<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Smobile | Sản phẩm</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="<c:url value='' />" rel="shortcut icon" type="image/x-icon"/>
   	<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/reset.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/base.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/user/product.css'/>" rel="stylesheet" />
  </head>
  <body class="d-flex flex-column h-100">
    <div class="container-fluid top-banner">
    </div>
    <header>
      <div class="container">
        <div class="container-fluid">
          <div class="row header-content">
            <div class="header-left">
                <a class="logo"></a>
            </div>
            <div class="search">
                <input type="text" class="search__input" placeholder="Bạn tìm gì..."/>
                <a href="#" class="search__item"></a>
            </div>
            <div class="header-right">
                <a href="#" id="history-buy">Lịch sử mua hàng</a>
                <a href="#" id="cart-box"></a>
                <a href="/" class="sign-up-btn">Đăng nhập</a>
                <a href="tel:18001999" class="switchboard">
                   1800.1999<span>Tổng đài miễm phí</span>
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
                <a class="nav-link" href="/home">TRANG CHỦ<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="/product">SẢN PHẨM</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">GIỚI THIỆU</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">TIN TỨC</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">LIÊN HỆ</a>
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
                  <img class="d-block w-100" src="<c:url value='/images/carousel/product-caroulse1.png'/>"/>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="<c:url value='/images/carousel/product-caroulse2.png'/>" />
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="<c:url value='/images/carousel/product-caroulse3.png'/>"/>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="<c:url value='/images/carousel/product-caroulse4.png'/>"/>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value='/images/carousel/product-caroulse5.png'/>"/>
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
              <img src="<c:url value='/images/news/tin-tuc1.png'/>"/>
              <img src="<c:url value='/images/news/tin-tuc2.png'/>"/>
            </div>
          </div>
        </section>
      </section> 

      <!-- Search area -->
      <div class="search-area">
        <div class="searchByBrand">
          <ul class="listBrand">
				<li class="list-brand__item">
					<input class="check" id="23" type="checkbox" value="23" name="brand.logo">
					<label class="label-item" for="23"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200911-1442-ptau9h.png"></label>
				</li>
				<li class="list-brand__item">
					<input class="check" id="22" type="checkbox" value="22" name="brand.logo">
					<label class="label-item" for="22"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2353-orclel.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="21" type="checkbox" value="21" name="brand.logo">
					<label class="label-item" for="21"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2352-c0alht.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="20" type="checkbox" value="20" name="brand.logo">
					<label class="label-item" for="20"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2351-f073vi.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="19" type="checkbox" value="19" name="brand.logo">
					<label class="label-item" for="19"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2346-1dlq9c.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="18" type="checkbox" value="18" name="brand.logo">
					<label class="label-item" for="18"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2345-vkteej.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="17" type="checkbox" value="17" name="brand.logo">
					<label class="label-item" for="17"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2344-qs4csq.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="16" type="checkbox" value="16" name="brand.logo">
					<label class="label-item" for="16"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2343-ao2e8g.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="15" type="checkbox" value="15" name="brand.logo">
					<label class="label-item" for="15"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2340-f7qdtb.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="14" type="checkbox" value="14" name="brand.logo">
					<label class="label-item" for="14"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2339-r0f3h9.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="12" type="checkbox" value="12" name="brand.logo">
					<label class="label-item" for="12"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2332-j1nq28.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="11" type="checkbox" value="11" name="brand.logo">
					<label class="label-item" for="11"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2334-8jnmkb.png"></label>
				</li>
			
				<li class="list-brand__item">
					<input class="check" id="10" type="checkbox" value="10" name="brand.logo">
					<label class="label-item" for="10"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-7l406b.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="9" type="checkbox" value="9" name="brand.logo">
					<label class="label-item" for="9"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-qaqn3i.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="8" type="checkbox" value="8" name="brand.logo">
					<label class="label-item" for="8"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-s6s58g.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="7" type="checkbox" value="7" name="brand.logo">
					<label class="label-item" for="7"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-57dutq.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="6" type="checkbox" value="6" name="brand.logo">
					<label class="label-item" for="6"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-ou2874.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="5" type="checkbox" value="5" name="brand.logo">
					<label class="label-item" for="5"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-f2ug5r.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="4" type="checkbox" value="4" name="brand.logo">
					<label class="label-item" for="4"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2337-fjmlah.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="3" type="checkbox" value="3" name="brand.logo">
					<label class="label-item" for="3"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2338-3lcmvh.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="2" type="checkbox" value="2" name="brand.logo">
					<label class="label-item" for="2"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200823-2338-lq96s7.png"></label>
				</li>
			
				<li class="list-brand__item" style="display: none;">
					<input class="check" id="1" type="checkbox" value="1" name="brand.logo">
					<label class="label-item" for="1"><img class="logo-brand" alt="Logo Brand" src="/images/brand/20200905-1620-km28qa.png"></label>
				</li>
				<span class="show-more">Xem thêm<i class="icon fas fa-caret-down"></i></span>
				<span class="hidden-item d-none">Ẩn bớt<i class="icon-up fas fa-sort-up"></i></span>
			</ul>
        </div>

        <div class="search-product ">
          <span>Khoảng giá:</span>
          <div class="search-product__price">
            <label class="price-labe price-labe-from" for="priceFrom">từ </label>
            <select class="price priceFrom form-control" name="priceForm"  id="priceFrom">
              <option value="">--- Giá Thấp Nhất ---</option>
              <option value="1000000">1.000.000₫</option>
              <option value="2000000">2.000.000₫</option>
              <option value="3000000">3.000.000₫</option>
              <option value="4000000">4.000.000₫</option>
            </select>
            <label class="price-labe price-labe-to" for="toPrice">đến </label>
            <select class="price form-control" name="priceTo" id="priceTo">
              <option value="" >--- Giá cao nhất---</option>
              <option value="1000000">1.000.000₫</option>
              <option value="2000000">2.000.000₫</option>
              <option value="4000000">4.000.000₫</option>
              <option value="8000000">8.000.000₫</option>
              <option value="10000000">10.000.000₫</option>
              <option value="20000000">20.000.000₫</option>
            </select>
          </div>
          <!-- Filter -->
          <div class="filter-area">
            <div class="filter-box">
              <span class="filter-box__title">Bộ lọc<i class="icon fas fa-caret-down"></i></span>
            </div>
            <div class="sort-box">
              <span class="sort-box__title">Sắp xếp<i class="icon fas fa-caret-down"></i></span>
            </div>
          </div>
          <!-- Button search -->
          <div class="btn-search">
            <button type="submit" id="searchByPrice" class="btn btn-success">Áp dụng</button>
          </div>
        </div>
        
        
      </div>
      <div id="resultSearch">
        <p></p>
      </div>
      <!-- Outstanding phone -->
      <section class="container-fluid outstanding-phone">
        <div class="outstanding-phone__header">
          <div class="title-outstanding">DANH SÁCH SẢN PHẨM</div>
        </div>
        <div class="tab-content">
          <div class="tab-product active">
            <ul class="list-promotion">
               <!-- Product 1 -->
               <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000</span>
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
                    <img class="product-promo--item-img" src="/images/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">6.690.000₫</strong>
                  <span class="price-sale"> Giảm <b>800.000₫</b></span>
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
              <li class="product-promo--item product-promo--item-type2">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/gstc3.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">IPhone 12 Pro Max 256GB</p>
                  <strong class="product-price-old">12.990.000₫ </strong>
                  <div class="product-price-sale">
                    <span class="product-sale">
                      Online giảm <span class="percent-sale">23%</span> còn
                      :
                    </span>
                    <strong class="product-price-new">9.990.000₫</strong>
                  </div>
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
                    <img class="product-promo--item-img" src="/images/gstc4.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label qua-ngon"></div>
                  <p class="product-name">
                    Samsung Galaxy A02
                  </p>
                  <strong class="product-price-new">9.690.000₫</strong>
                  <span class="price-sale">
                    Giảm <b>500.000₫</b> và quà <b>800.000₫</b>
                  </span>
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
              <li class="product-promo--item product-promo--item-type2">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/gstc5.jpg" alt=""/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">Xiaomi Redmi 9T(4GB/64GB)</p>
                  <strong class="product-price-old">12.400.000₫ </strong>
                  <div class="product-price-sale">
                    <span class="product-sale">
                      Online giảm <span class="percent-sale">22%</span> còn
                      :
                    </span>
                    <strong class="product-price-new"> 9.600.000₫ </strong>
                  </div>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">77 đánh giá</span>
                </div>
              </li>
               <!-- Product 1 -->
               <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000</span>
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
                    <img class="product-promo--item-img" src="/images/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">6.690.000₫</strong>
                  <span class="price-sale"> Giảm <b>800.000₫</b></span>
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
              <li class="product-promo--item product-promo--item-type2">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/gstc3.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">IPhone 12 Pro Max 256GB</p>
                  <strong class="product-price-old">12.990.000₫ </strong>
                  <div class="product-price-sale">
                    <span class="product-sale">
                      Online giảm <span class="percent-sale">23%</span> còn
                      :
                    </span>
                    <strong class="product-price-new">9.990.000₫</strong>
                  </div>
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
                    <img class="product-promo--item-img" src="/images/gstc4.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label qua-ngon"></div>
                  <p class="product-name">
                    Samsung Galaxy A02
                  </p>
                  <strong class="product-price-new">9.690.000₫</strong>
                  <span class="price-sale">
                    Giảm <b>500.000₫</b> và quà <b>800.000₫</b>
                  </span>
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
              <li class="product-promo--item product-promo--item-type2">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/gstc5.jpg" alt=""/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">Xiaomi Redmi 9T(4GB/64GB)</p>
                  <strong class="product-price-old">12.400.000₫ </strong>
                  <div class="product-price-sale">
                    <span class="product-sale">
                      Online giảm <span class="percent-sale">22%</span> còn
                      :
                    </span>
                    <strong class="product-price-new"> 9.600.000₫ </strong>
                  </div>
                </a>
                <div class="rating">
                  <span class="rating__start">
                    <b>3.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">77 đánh giá</span>
                </div>
              </li> <!-- Product 1 -->
              <li class="product-promo--item">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000</span>
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
                    <img class="product-promo--item-img" src="/images/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">6.690.000₫</strong>
                  <span class="price-sale"> Giảm <b>800.000₫</b></span>
                </a>

                <div class="rating">
                  <span class="rating__start">
                    <b>2.9</b>/5
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="sl-rating">11 đánh giá</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <button type="button" class="btn view-all-product">
          <a href="/" class="view-all-product--link">
            Xem tất cả <span class="total-product">175</span> điện thoại<i class="icon-arrow-down fas fa-sort-down"></i>
          </a>
        </button>
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
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img src="/images/gsct1.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc" />
                  </div>
                  <p class="product-name">
                    Samsung Galaxy A52 5G
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">5.990.000₫</strong>
                  <span class="product-price-old"> 6.990.000</span>
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
                    <img class="product-promo--item-img" src="/images/gstc2.jpg" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">
                    Xiami Redmi Note 10 Pro MFF
                    <span class="new-2020">Mới 2020</span>
                  </p>
                  <strong class="product-price-new">6.690.000₫</strong>
                  <span class="price-sale"> Giảm <b>800.000₫</b></span>
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
              <li class="product-promo--item product-promo--item-type2">
                <a href="/">
                  <div class="img-container">
                    <span class="tra-gop">Trả góp 0%</span>
                    <img class="product-promo--item-img" src="/images/gstc3.jpg" alt="" data-holder-rendered="true"/>
                  </div>
                  <div class="img-label">
                    <img src="/images/online-giảm-sốc-1x.png" alt="Gia soc"/>
                  </div>
                  <p class="product-name">IPhone 12 Pro Max 256GB</p>
                  <strong class="product-price-old">12.990.000₫ </strong>
                  <div class="product-price-sale">
                    <span class="product-sale">
                      Online giảm <span class="percent-sale">23%</span> còn
                      :
                    </span>
                    <strong class="product-price-new">9.990.000₫</strong>
                  </div>
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
            <li class="col-footer-link title-col">Thông tin điện máy xanh</li>
            <li><a href="/" class="col-footer-link">Hệ thống 1064 siêu thị <small>(8:00 - 22:00)</small></a></li>
            <li><a href="/" class="col-footer-link">Giới thiệu công ty</a></li>
            <li><a href="/" class="col-footer-link">Tìm việc làm</a></li>
            <li><a href="/" class="col-footer-link">Liên h góp ý</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link ">Nội quy cửa hàng</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link">In hóa đơn điện tử</a></li>
            <li class="col-hidden"><a href="/" class="col-footer-link">Bán hàng doanh nghiệp</a></li>
            <p class="col-footer-link showMore">Xem thêm</p>
          </ul>
          <ul class="col-footer">
            <li class="col-footer-link title-col">Hỗ trợ khách hàng</li>
            <li><a href="/" class="col-footer-link">Tìm hiểu về mua trả góp</a></li>
            <li><a href="/" class="col-footer-link">Giao hàng, lắp đặt</a></li>
            <li><a href="/" class="col-footer-link">Bảo hành, đổi trả</a></li>
            <li><a href="/" class="col-footer-link">DV vệ sinh máy lạnh, máy giặt, quạt</a></li>
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
            <li><p class="col-footer-link">Kỹ thuật <a class="tel-phone" href="tel:1800.1061"> 1800.1764 </a> (7:30 - 22:00)</p></li>
            <li><p class="col-footer-link">Bảo hành <a class="tel-phone" href="tel:1800.1061"> 1800.1065 </a> (8:00 - 21:00)</p></li>
            <li><p class="col-footer-link">Khiếu nại <a class="tel-phone" href="tel:1800.1061"> 1800.1061 </a> (8:00 - 21:30)</p></li>
            <li><i class="icondmx-btc"></i> <i class="icondmx-huychuong"></i> <i class="icondmx-dmca"></i></i></li>
          </ul>
          <ul class="col-footer">
              <li class="social">
                <a href="/" class="social__share"><i class="iconfb"></i> 1559.6k fan </a>
                <a href="/" class="social__share"><i class="iconyt"></i>  490k đăng ký  </a>
              </li>
              <li class="group-of-dmx">
                <p>Website cùng tập đoàn:</p>
                <i class="iconmagd"></i>
                <i class="icontgdd"></i>
                <i class="iconbhx"></i>
              </li>
          </ul>
        </div>  
        <div class="row-footer-2">
          <p>© 2018. Công ty cổ phần Thế Giới Di Động. GPDKKD: 0303217354 do sở KH & ĐT TP.HCM cấp ngày 02/01/2007. 
            GP số 57/GP-TTĐT do Sở TTTT TP HCM cấp ngày 30/07/2018. <br>
            Địa chỉ: 128 Trần Quang Khải, P. Tân Định, Quận 1, TP.Hồ Chí Minh. Điện thoại: (028)3812.59.60. Email: cskh@dienmayxanh.com.
            Chịu trách nhiệm nội dung: Trần Nhật Linh. 
            <a href="/" >Xem chính sách sử dụng web</a>
          </p>
        </div>
      </div>
    </footer>
    <div id="goto-top">↑</div>
    <script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js' />"></script>
    <script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/js/base.js' />"></script>
    <script src="<c:url value='/js/user/product.js'/>"></script>
  </body>
</html>