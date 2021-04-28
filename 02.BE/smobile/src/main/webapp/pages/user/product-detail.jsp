<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Smobile | Chi tiết sản phẩm</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/reset.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/base.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/user/product-detail.css'/>" rel="stylesheet">
  </head>
  <body class="d-flex flex-column h-100">
    <header>
      <div class="container">
        <div class="container-fluid">
          <div class="row header-content">
            <div class="header-left">
                <a href="./index.html" class="logo"></a>
            </div>
            <div class="search">
                <input type="text" class="search__input" placeholder="Bạn tìm gì..."/>
                <a href="/pages/user/product.html" class="search__item"></a>
            </div>
            <div class="header-right">
                <a href="/pages/user/history-buy.html" id="history-buy">Lịch sử mua hàng</a>
                <a href="/pages/user/cart.html" id="cart-box"><span class="quantity-product">5</span></a>
                <a href="/pages/login.html" class="sign-up-btn"><i class="fas fa-sign-in-alt"></i> Đăng nhập/Đăng ký</a>
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
                <a class="nav-link" href="index.html"><i class="icon-nav fas fa-home"></i>TRANG CHỦ</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="/pages/user/product.html"><i class=" icon-nav fas fa-mobile-alt"></i>SẢN PHẨM</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/pages/user/news.html"><i class="icon-nav far fa-newspaper"></i>TIN TỨC </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/pages/user/contact-us.html"><i class="icon-nav fas fa-phone-square"></i>LIÊN HỆ</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </div>
    <main class="container">
      <!-- Breadcrumbs  -->
      <section>
          <div class="breadcrumbs">
              <ul>
                  <li><a href="/">Trang chủ</a><i class="fas fa-angle-right"></i></li>
                  <li><a href="/">Apple</a><i class="fas fa-angle-right"></i></li>
                  <li><a href="/">iPhone 12 Pro Max I Chính hãng VN/A</a></li>
              </ul>
          </div>
      </section>
      <!-- Product essential -->
      <section class="top-view">
            <h1>iPhone 12 Pro Max I Chính hãng VN/A </h1>
            <span class="rasting-result">
                <i class="fa fa-star checked"></i>
                <i class="fa fa-star checked"></i>
                <i class="fa fa-star checked"></i>
                <i class="fa fa-star checked"></i>
                <i class="fa fa-star checked"></i>
                <a href="/" class="">135 lượt đánh giá</a>
            </span>
      </section>
      <hr>
      <section class="product-essential">
        <form action="" method="POST" class="product-essential__form">
          <div class="product-essential__left">
              <div class="carousel-sale">
                <div id="myCarouselProduct" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img class="d-block w-100" src="/images/product/gstc3.jpg"/>
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/images/product/gstc4.jpg" />
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/images/product/gstc5.jpg"/>
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="/images/product/gstc6.jpg"/>  
                    </div>
                  </div>
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#myCarouselProduct" data-slide-to="0" class="active">
                      <img class="d-block w-40" src="/images/product/gstc3.jpg"/>
                    </li>
                    <li data-target="#myCarouselProduct" data-slide-to="1">
                      <img class="d-block w-40" src="/images/product/gstc4.jpg"/>
                    </li>
                    <li data-target="#myCarouselProduct" data-slide-to="2">
                      <img class="d-block w-40" src="/images/product/gstc5.jpg"/>
                    </li>
                    <li data-target="#myCarouselProduct" data-slide-to="3">
                      <img class="d-block w-40" src="/images/product/gstc6.jpg"/>
                    </li>
                  </ol>

                  <a class="carousel-control-prev" href="#myCarouselProduct" role="button"  data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#myCarouselProduct" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
          </div>
          <div class="product-essential__right">
            <div class="product-price">
                <div class="product-price__title">
                  <span class="sale-price">16.590.000 ₫</span>
                  Giá niêm yết: 
                  <span class="unit-price">18.990.000 ₫</span>
                  <button type="button" class="btn btn-aqua btn-tra-gop">Trả góp 0%</button>
                </div>
                <ul class="list-product-memory">
                  <li class="item-product-memory memory-active">
                    <a href="#" class="item-product-memory--link ">
                        <span>64GB</span>
                        <strong>16.590.000 ₫</strong>
                    </a>
                  </li>
                  <li class="item-product-memory">
                    <a href="#" class="item-product-memory--link">
                        <span>128GB</span>
                        <strong>18.290.000 ₫</strong>
                    </a>
                  </li>
                  <li class="item-product-memory">
                    <a href="#" class="item-product-memory--link">
                        <span>256GB</span>
                        <strong>19.990.000 ₫</strong>
                    </a>
                   </li>
                </ul>
            </div>
            <div class="product-color">
                <h3>Chọn màu và xem giá sản phẩm</h3>
                <ul class="list-product-color">
                  <li class="item-product-color">
                      <input class="check" id="temp1" type="checkbox" value=" " name="brand.logo">
                      <label for="temp1">
                        <span>Tím</span>
                        <strong>16.590.000₫</strong>
                      </label>
                  </li>
                  <li class="item-product-color">
                    <input class="check" id="temp2" type="checkbox" value=" " name="brand.logo">
                    <label for="temp2">
                      <span>Vàng</span>
                      <strong>16.590.000₫</strong>
                    </label>
                 </li>
                  <li class="item-product-color">
                    <input class="check" id="temp3" type="checkbox" value=" " name="brand.logo">
                    <label for="temp1">
                      <span>Xám</span>
                      <strong>16.590.000 ₫</strong>
                    </label>
                  </li>
              </ul>
              
            </div>
            <div class="box-promo">
              <span class="box-promo__title">Nhận ngay khuyến mại đặc biệt</span>
              <ul class="box-promo__list">
                <li><i class="icon-ok-circled fas fa-check-circle"></i>Trả góp 0%</li>
                <li><i class="icon-ok-circled fas fa-check-circle"></i>Tặng gói iCloud 50GB miễn phí 3 tháng</li>
                <li><i class="icon-ok-circled fas fa-check-circle"></i>Thu cũ đổi mới - Trợ giá ngay 15% </li>
              </ul>
            </div>
            <button class="btn btn-aqua btn-check-out" type="submit"><span>Mua Ngay</span>(Giao tận nơi hoặc lấy tại cửa hàng)</button>
          </div>
        </form>
      </section>

      <section class="box-product-info">
        <div class="box-product-info__left">
          <div class="box-product-info__left__title">
              <h2>Điện thoại iPhone 12 Pro Max: Nâng tầm đẳng cấp sử dụng</h2>
          </div>
          <div class="box-product-info__left__content">
              <p>Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là <strong>iPhone 12 Pro Max</strong>, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.</p>
              <p>Năm nay, công nghệ màn hình trên 12 Pro Max cũng được đổi mới và trang bị tốt hơn cùng kích thước lên đến 6.7 inch, lớn hơn so với điện thoại iPhone 12. Với công nghệ màn hình OLED cho khả năng hiển thị hình ảnh lên đến 2778 x 1284 pixels. Bên cạnh đó, màn hình này còn cho độ sáng tối đa cao nhất lên đến 800 nits, luôn đảm bảo cho bạn một độ sáng cao và dễ nhìn nhất ngoài nắng.</p>
          </div>
          <hr>
          <!-- Rate & Comment -->
          <form action="" method="POST">
            <section class="box-qa">
              <h2 class="box-qa__title">Đánh giá & nhận xét iPhone 12 Pro Max I Chính hãng VN/A </h2>
              <div class="box-qa__rate">
                <div class="box-qa__rate__point">
                  <h3>SAO TRUNG BÌNH</h3>
                  <p class="averaRatings">4.9/5</p>
                  <i class="fa fa-star icon-star" style="font-size: 40px"></i>
                </div>
                <div class="box-qa__rate__statistics">
                  <ul>
                    <li>
                      <span>5<i class="icon-star fa fa-star"></i></span>
                      <span>135 lượt đánh giá</span>
                    </li>
                    <li>
                      <span>4<i class="icon-star fa fa-star"></i></span>
                      <span>120 lượt đánh giá</span>
                    </li>
                    <li>
                      <span>3<i class="icon-star fa fa-star"></i></span>
                      <span>10 lượt đánh giá</span>
                    </li>
                    <li>
                      <span>2<i class="icon-star fa fa-star"></i></span>
                      <span>0 lượt đánh giá</span>
                    </li>
                    <li>
                      <span>1<i class="icon-star fa fa-star"></i></span>
                      <span>0 lượt đánh giá</span>
                    </li>
                  </ul>
                </div>
                <div class="box-qa__rate__show-form">
                  <button type="button" class="btn btn-aqua btn-send-rate"> Gửi đánh giá của bạn</button>
                </div>
              </div>
            </section>
            <div class="box-qa__comment d-none">
              <div class="box-qa__comment__data">
                <div class="box-qa__vote">
                  <div class="box-qa__vote__title">Vui lòng chọn đánh giá: </div>
                  <ul>
                    <li>
                      <span><i class="icon-star fa fa-star"></i></span>
                    </li>
                    <li>
                      <span><i class="icon-star fa fa-star"></i></span>
                    </li>
                    <li>
                      <span><i class="icon-star fa fa-star"></i></span>
                    </li>
                    <li>
                      <span><i class="icon-star fa fa-star"></i></span>
                    </li>
                    <li>
                      <span><i class="icon-star fa fa-star"></i></span>
                    </li>
                  </ul>
                </div>
                <div class="form-group comment-content">
                  <label for="commentContent">Đánh giá</label>
                  <textarea class="form-control" rows="5" id="commentContent" name="commentContent" spellcheck="false"></textarea>
                </div>
                <!-- <div class="form-group image-comment">
                  <label for="imageComenet">Upload hình ảnh:</label>
                  <input type="file" class="form-control" id="imageComenet" name="imageComenet" multiple="multiple"">
                </div> -->
              </div>
              <button type="submit" class="btn btn-aqua btnSubmitRateComment">Gửi đánh giá</button>
            </div>
          </form>
          <hr>
          <!-- List reviewer -->
          <section class="box-reviewer">
            <div>
              <ul class="box-reviewer__list">
                <li class="box-reviewer__item">
                  <img class="img-avt w-30" src="/images/avt.jpg" alt="">
                  <div>
                    <span class="box-reviewer__item--name">Trần Hồng Dương</span> 
                    <br>
                    <span class="box-reviewer__item--star">
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <span class="box-reviewer__item--date">Ngày 2021-02-02</span>
                    </span>
                    <p class="box-reviewer__item--content">Nếu mua tôi vẫn chọn mua ở Smobile, Rất uy tín.</p>
                  </div>
                </li>
                <li class="box-reviewer__item">
                  <img class="img-avt w-30" src="/images/avt.jpg" alt="">
                  <div>
                    <span class="box-reviewer__item--name">Trần Hồng Dương</span> 
                    <br>
                    <span class="box-reviewer__item--star">
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <span class="box-reviewer__item--date">Ngày 2021-02-02</span>
                    </span>
                    <p class="box-reviewer__item--content">Tốt, nhân viên thân thiện</p>
                  </div>
                </li>
                <li class="box-reviewer__item">
                  <img class="img-avt w-30" src="/images/avt.jpg" alt="">
                  <div>
                    <span class="box-reviewer__item--name">Chung Thái Thanh Trúc</span> 
                    <br>
                    <span class="box-reviewer__item--star">
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <i class="fa fa-star checked"></i>
                      <span class="box-reviewer__item--date">Ngày 2021-02-02</span>
                    </span>
                    <p class="box-reviewer__item--content">Sản phẩm O</p>
                  </div>
                </li>
                <li class="box-reviewer__item"><a href="/" class="btn btn-view-all">Xem tất cả đánh giá <i class="fas fa-chevron-right"></i></a></li>
              </ul>
            </div>
          </section>
        </div>
        <div class="box-product-info___right">
          <div class="card">
            <div class="card-header">
              Thống số kỹ thuật
            </div>
            <div class="card-body">
              <table class="table table-striped table-content">
                <tbody>
                  <tr>
                    <td>Màn hình</td>
                    <td><span>6.1", Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</span></td>
                  </tr>
                  <tr>
                    <td>Camera sau</td>
                    <td><span>12.0 MP + 12.0 MP</span></td>
                  </tr>
                  <tr>
                    <td>Camera Selfie</td>
                    <td><span>12.0 MP</span></td>
                  </tr>
                  <tr>
                    <td>RAM&nbsp;</td>
                    <td><span>4 GB</span></td>
                  </tr>
                  <tr>
                    <td>Bộ nhớ trong</td>
                    <td><span>256 GB</span></td>
                  </tr>
                  <tr>
                    <td>CPU</td>
                    <td><span>A13 Bionic</span></td>
                  </tr>
                  <tr>
                    <td>GPU</td>
                    <td><span>Apple GPU 4 nhân</span></td>
                  </tr>
                  <tr>
                    <td>Dung lượng pin</td>
                    <td><span>3110 mAh</span></td>
                  </tr>
                  <tr>
                    <td>Thẻ sim</td>
                    <td><span>2, 1 eSIM, 1 Nano SIM</span></td>
                  </tr>
                  <tr>
                    <td>Hệ điều hành</td>
                    <td><span>iOS 14</span></td>
                  </tr>
                  <tr>
                    <td>Xuất xứ</td>
                    <td><span>Trung Quốc</span></td>
                  </tr>
                  <tr>
                    <td>Thời gian ra mắt</td>
                    <td><span>09/2019</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
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
	<script src="<c:url value='/js/base.js'/>"></script>
	<script src="<c:url value='/js/user/product-detail.js'/>"></script>
  </body>
</html>
