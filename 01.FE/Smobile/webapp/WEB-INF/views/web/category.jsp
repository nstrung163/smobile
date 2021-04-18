<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<link rel="stylesheet" href="<c:url value ='/template/web/css/category.css'/>">

<!-- container-private -->
<!-- Category-->
<section class="category">
	<div class="container">
		<div class="row pb-1">
			<div class="link-menu">
				<ul class="link-menu-list  flex-column mt-3">
					<li class="nav-item link-menu-name"><a href="#"
						class=" link-page-name">TRANG CHỦ <span> / </span></a></li>
					<li class="nav-item link-menu-name"><a href="#"
						class=" text-dark">ÁO QUẦN NAM</a></li>
				</ul>
			</div>
		</div>
		<div class="row pb-2">
			<div class=" filter ">
				<p class="pr-3 float-left">Hiển thị một kết quả duy nhất</p>
				<select id="salePriceSelected" class=" float-left">
					<option value="0" selected="selected">Thứ tự mặc định</option>
					<option value="1">Thứ tự tăng theo giá</option>
					<option value="2">Thứ tự giảm theo giá</option>
					<!-- <option value="3">Theo sản phẩm mới ra mắt</option> -->
				</select> <a
					class="navbar-toggler nav-button float-right pr-5 btn-show-category-menu"
					type="button" data-toggle="collapse" data-target="#categoryMenu">
					<h5 class="font-weight-bold text-dark">
						Nhiều hơn <span class="fas fa-lg fa-caret-square-down"></span>
					</h5>

				</a>
			</div>
			<div></div>
		</div>

		<div class="row">
			<div class="col-lg-2 col-md-4  category-menu  collapse pt-3"
				id="categoryMenu">
				<h5 class="font-weight-bold text-dark">DANH MỤC SẢN PHẨM</h5>
				<ul class="navbar-nav flex-column mt-3">
				<c:forEach items="${ categories }" var="category">
					<li class="nav-item">
						<a data-id="${ category.categoryId }" class="nav-link px-3 category-list-name product-search">${ category.categoryName }</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="col-lg-2 col-md-4  category-menu-1  pt-3">
				<h5 class="font-weight-bold text-dark">DANH MỤC SẢN PHẨM</h5>
				<ul class="navbar-nav flex-column mt-3">
				<c:forEach items="${ categories }" var="category">
					<li class="nav-item">
						<a data-id="${ category.categoryId }" class="nav-link px-3 category-list-name product-search">${ category.categoryName }</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="col-lg-10 col-md-8 category-list">
				<p id="message-search"></p>
				<div class="row" id="listProducts">
				</div>
			</div>
		</div>
	</div>
</section>
<div class="pagination-area">
	<ul class="pagination">
	</ul>
</div>


<!--end of Category-->
<!-- End container-private -->
<script src="<c:url value='/template/web/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/js/category-search.js'/>"></script> 