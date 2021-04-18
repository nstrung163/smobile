<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 
 
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
						<c:forEach items="${ listcategory }" var = "category">
							<li class="nav-item"><a href="#"
							class="nav-link  px-3 mb-2 category-list-name"> ${category.categoryName} </a></li>
						</c:forEach>
 
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
						<c:forEach items="${listBrand}" var="brand">
							<div class="form-check p-3">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckChecked" checked> <label
									class="form-check-label pl-3" for="flexCheckChecked">
									${brand.brandName} </label>
							</div>
						</c:forEach>
					</form>
				</div>
			</div>
			<div class="col-lg-9 search-content">
				<div class="search-message">
					<p>
						Sản phẩm khuyến mãi : <span class="text-secondary">&nbsp;
							</span>
					</p>
				</div>
				<div class="row" id="productSale">
 
				</div>
			</div>
		</div>
	</div>
</section>
<!--end of search-page-->
<!-- Script -->
	<script
		src="<c:url value='/template/web/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
	<script
		src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/web/js/app.js'/>"></script>
<script src="https://k...content-available-to-author-only...e.com/c8c1e5cdb3.js"></script>
<script src="<c:url value='/template/web/js/product-sale.js'/>"></script>