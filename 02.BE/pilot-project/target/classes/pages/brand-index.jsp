<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Brand Management</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/brand.css'/>">

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
				      <a class="nav-item nav-link " href="/product">Product <span class="sr-only">(current)</span></a>
				      <a class="nav-item nav-link active" href="/brand">Brand</a>
				    </div>
				  </div>
				</div>
				<div class="right"> <a class="nav-item nav-link logo" href="logout">Logout</a></div>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="sub-header">
			<div class="sub-title">Brand Management</div>
			<div ><a class="add-btn" id="addBrandInfoModal"><button class="btn-add btn btn-outline-success" type="button"><i class="icon-add fas fa-plus-square"></i>Add New Brand</button></a></div>
		</div>
		<div class="search-result">
			<div class="form-search">
				<input type="text"  class="form-control" placeholder="Brand Name" id="keyword">
				<button type="submit" name="searchBrand" id="searchBrand" class="btn btn-success">Search</button>
				<button type="button" class="reset-page btn btn-secondary" id="restPage">Reset</button>
			</div>
			<div id="resultSearch">
				<p ></p>
			</div>
		</div>
		<table class="table table-bordered table-hover" id="brandInfoTable">
			<thead>
				<tr class="text-center tr-bg">
					<th scope="col">No</th>
					<th scope="col">Name</th>
					<th scope="col">Logo</th>
					<th scope="col">Description</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<ul class="pagination">
			</ul>
		</div>
	</div>
	<!-- Modal form Add new brand and Edit brand -->
	<div class="modal fade" id="brandInfoModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="brandInfoForm" role="form" enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-title">Add New Brand</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group d-none">
							<label for="brandID">Brand ID</label>
							<input type="text" class="form-control" name="brandId" id="brandId" placeholder="Brand ID" readonly>
						</div>
						<div class="form-group">
							<label for="brandName">Brand Name <span class="required-field">(*)</span></label>
							<input type="text" class="form-control" id="brandName" name="brandName" placeholder="Brand Name">
						</div>
						<div class="form-group" id="brandLogo">
							<label for="logo">Logo <span class="required-field">(*)</span></label>
							<div class="preview-image-upload" id="logoImg">
								<img src="<c:url value='/images/image-demo.png'/>" alt="image">
							</div>
							<input type="file" class="form-control upload-image" name="logoFiles" accept="image/*" />
							<input type="hidden" class="old-img" id="logo" name="logo">
						</div>
						<div class="form-group">
							<label for="description">Description</label>
							<textarea name="description" id="description" cols="30" rows="3" class="form-control" placeholder="Description"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="saveBrandBtn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal Confirm Deleting Brand -->
	<div class="modal fade" id="confirmDeleteModal" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Brand</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Do you want to delete <b id="deletedBrandName"></b>?</p>
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
<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
<script src="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.js'/>"></script>
<script src="<c:url value='/js/base.js'/>"></script>
<script src="<c:url value='/js/brand.js'/>"></script>	
</body>
</html>