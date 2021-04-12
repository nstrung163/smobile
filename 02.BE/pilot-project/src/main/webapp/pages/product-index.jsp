<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/product.css'/>">
</head>
<body>
	<div class="nav-bg">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light ">
			<div class="left">
			  <a class="navbar-brand">PILOT PROJECT</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    <div class="navbar-nav">
			      <a class="nav-item nav-link active" href="/product">Product <span class="sr-only">(current)</span></a>
			      <a class="nav-item nav-link" href="/brand">Brand</a>
			    </div>
			  </div>
			</div>
			<div class="right"> <a class="nav-item nav-link logo" href="logout">Logout</a></div>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="sub-header row">
			<div class="sub-title">Product Management</div>
			<div ><a class="add-btn" id="addProductInfoModal"><button class="btn-add btn btn-outline-success" type="button"><i class="icon-add fas fa-plus-square"></i>Add New Product</button></a></div>
		</div>
		<div class="search-area">
			<div class="search-product form-group">
				<div class="search-product__name">
					<input type="text" class="form-control search-brand" placeholder="Product Name, Brand Name" id="keyword">
				</div>
				<div class="search-product__price">
					<label class="price-labe price-labe-from" for="priceFrom">Price From </label>
					<select class="price priceFrom form-control" name="priceForm"  id="priceFrom">
						<option value="">--- Lowest Price ---</option>
						<option value="1000000">1.000.000₫</option>
						<option value="2000000">2.000.000₫</option>
						<option value="3000000">3.000.000₫</option>
						<option value="4000000">4.000.000₫</option>
					</select>
					<label class="price-labe" for="toPrice">Price To </label>
					<select class="price toPrice form-control" name="priceTo" id="priceTo">
						<option value="" >--- Highest price ---</option>
						<option value="1000000">1.000.000₫</option>
						<option value="2000000">2.000.000₫</option>
						<option value="4000000">4.000.000₫</option>
						<option value="8000000">8.000.000₫</option>
						<option value="10000000">10.000.000₫</option>
						<option value="20000000">20.000.000₫</option>
					</select>
				</div>
				<div class="btn-search">
					<button type="submit" id="searchByPrice" class="btn btn-success">Search</button>
					<button type="button" class="reset-page btn btn-secondary" id="restPage">Reset</button>
				</div>
			</div>
			<div class="searchByBrand">
				<ul class="listBrand">
					<c:forEach items="${listBrand}" var="brand">
						<li class="list-brand__item">
							<input class="check" id="${brand.brandId}" type="checkbox" value="${brand.brandId}" name="brand.logo">
							<!-- <span class="icon-check"><i class="fas fa-check"></i></span> -->
							<label for="${brand.brandId}"><img class="logo-brand" alt="Logo Brand" src="${brand.logo}"></label>
						</li>
					</c:forEach>
					<span class="show-more">Show more<i class="icon fas fa-caret-down"></i></span>
					<span class="hidden-item d-none">Hidden <i class="icon-up fas fa-sort-up"></i></span>
				</ul>
			</div>
		</div>
		<div id="resultSearch">
			<p></p>
		</div>
		<table class="table table-bordered table-hover" id="productInfoTable">
			<thead>
				<tr class="text-center  tr-bg">
					<th scope="col">No</th>
					<th scope="col">Product</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Brand</th>
					<th scope="col">Sale Date</th>
					<th scope="col">Description</th>
					<th scope="col">Image</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div class="d-flex justify-content-center">
			<ul class="pagination"></ul>
		</div>
	</div>
	<!-- Modal form add new product and Edit product -->
	<div class="modal fade" id="productInfoModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="productInfoForm" role="form" enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-title">Add New Product</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group d-none">
							<label for="productId">Product ID</label>
							<input type="text" class="form-control" name="productId" id="productId" placeholder="Product ID" readonly="readonly">
						</div>
						<div class="form-group product-name" id="product-name">
							<label for="productName">Product name <span class="required-field">(*)</span></label>
							<input type="text" class="form-control" name="productName" id="productName" placeholder="Name of the product" aria-describedby="basic-addon1">
						</div>
						<div class="group-quantity-price">
							<div class="form-group quantity-form">
								<label for="quantity">Quantity <span class="required-field">(*)</span></label>
								<input type="text" class="form-control quantity-input" name="quantity" id="quantity" placeholder="Quantity of product">
							</div>
							<div class="form-group price-form">
								<label for="price">Price <span class="required-field">(*)</span></label>
								<input type="text" class="form-control" name="price" id="price" placeholder="Price of product">
							</div>
						</div>
						<!-- Brand name -->
						<div class="group-quantity-price">
							<div class="form-group brand-logo">
								<label for="brandId">Brand Name</label>
								<select  class="form-control" id="brandId" name ="brandEntity.brandId">
									<c:forEach items="${listBrand}" var="brand">
										<option value="${brand.brandId}" class="form-select">${brand.brandName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group saleDate">
								<label for="saleDate">Sale Date <span class="required-field">(*)</span></label>
								<input type="date" class="form-control" name="saleDate" id="saleDate" value="">
							</div>
						</div>
						<div class="group-img-description">
							<div class="form-group img-product" id="productImage">
								<label for="image">Image <span class="required-field">(*)</span></label>
								<div class="preview-image-upload" id="logoImg">
									<img src="<c:url value='/images/image-demo.png'/>" alt="image">
								</div>
								<input type="file" class="form-control upload-image" name="logoFiles" accept="image/*" />
								<input type="hidden" class="old-img" id="image" name="image">
							</div>
							<div class="form-group description">
								<label for="description">Description </label>
								<textarea cols="30" rows="4" class="form-control" name="description" id="description" placeholder="Description of product"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="saveProductBtn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal confirm deleting product -->
	<div class="modal fade" id="confirmDeleteModal" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Product</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Do you want to delete <b id="deletedProductName"></b>?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="deleteSubmitBtn">Confirm</button>
				</div>
			</div>
		</div>
	</div>


<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<%-- <script src="<c:url value='https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js'/>"></script>
 --%>
 <script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
<script src="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.js'/>"></script>
<script src="<c:url value='/js/base.js'/>"></script>
<script src="<c:url value='/js/product.js'/>"></script>
</body>
</html>