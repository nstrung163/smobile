<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<link rel="stylesheet"
	href="<c:url value='/template/web/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/search-page.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/category-infor.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/category.css'/>">


<!-- search-page-->
<section class="search-page pb-3">
	<div class="container">
		<div class="row pt-4">
			<div class="col-lg-3 col-md-4 filter pt-4">
				<div class="category-menu ">
					<h4 class="font-weight-bold">DANH MỤC SẢN PHẨM</h4>
					<ul class="navbar-nav flex-column mt-3">
						<li class="nav-item"><a href="#"
							class="nav-link px-3 category-list-name"> Áo phông nam </a></li>
						<li class="nav-item"><a href="#"
							class="nav-link  px-3 mb-2 category-list-name"> Sơ mi nam </a></li>
						<li class="nav-item"><a href="#"
							class="nav-link  px-3 mb-2 category-list-name"> Sơ mi nam </a></li>
					</ul>
				</div>
				<div class="search-price pt-3">
					<h4 class="font-weight-bold text-uppercase text-dark">Giá</h4>
					<p>Chọn khoảng giá</p>
					<form action="#" method="POST" class="search-price-form">
						<input type="number" class="" value="0"> <label
							class="text-uppercase font-weight-bold text-dark"> - </label> <input
							type="number" class="" value="0"> <a type="button"
							class="btn mx-5">Áp dụng</a>
					</form>
				</div>
				<div class="category-menu ">
					<h4 class="font-weight-bold pt-5">NHÀ CUNG CẤP</h4>
					<form action="#" method="POST" class="">
						<div class="form-check p-3">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked" checked> <label
								class="form-check-label pl-3" for="flexCheckChecked">
								Vinfast </label>
						</div>
						<div class="form-check p-3">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked"> <label
								class="form-check-label  pl-3" for="flexCheckChecked">
								ABC groups </label>
						</div>
						<div class="form-check p-3">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked"> <label
								class="form-check-label  pl-3" for="flexCheckChecked">
								Đồng Khởi Group </label>
						</div>
						<div class="form-check p-3">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckChecked"> <label
								class="form-check-label  pl-3" for="flexCheckChecked">
								ESLY </label>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-9 search-content">
				<div class="search-message">
					<p>
						Kết quả tìm kiếm cho 'Áo khoác nam' : <span class="text-secondary">&nbsp;
							111 kết quả</span>
					</p>
				</div>
				<div id="productSale" class="row">
					<div class="col-6 col-lg-3 col-md-4  ">
						<div class="category-box">
							<img src="<c:url value='/img/category2.jpg'/>" alt="#" width="100%"
								class="img img-responsive">
							<p class="category-name">Giày thể thao nam.....</p>
							<div
								class="card-text text-left font-weight-bold d-flex justify-content-center">
								<span class="product__price product__price-old">500,000đ</span>
								<span class="product__price product__price-new">500,000đ</span>
							</div>
							<a href="" class="btn  margin__btn-add-cart m-auto">Thêm vào
								Giỏ</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</section>
<script src="<c:url value='/template/web/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/js/productsale.js'/>"></script>
<!--end of search-page-->
<!-- <script src="https://kit.fontawesome.com/c8c1e5cdb3.js"></script>
 -->