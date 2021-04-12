<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update brand</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/brand.css'/>">
</head>
<body>
	<div class="container">
		<div class="sub-header">
			<div class="float-left sub-title">Update Brand</div>
		</div>
		<div class="w-50 mx-auto">
			<c:if test="${not empty errorMessage}">
				<div class="message-area">
					<div class="error-message-invalid">${errorMessage}</div>
				</div>
			</c:if>
			<c:choose>
				<c:when test="${not empty brandEntity}">
					<form action="/brand/update" id="brandInfoForm" role="form" method="POST" enctype="multipart/form-data">
						<div class="modal-body">
							<div class="form-group">
								<label for="brandId">Brand ID</label>
								<input type="text" class="form-control" name="brandId" id="brandId" value="${brandEntity.brandId}" readonly="readonly" >
							</div>
							<div class="form-group">
								<label for="brandName">Brand Name</label>
								<input type="text" class="form-control" id="brandName" name="brandName" placeholder="Brand Name" value="${brandEntity.brandName}">
							</div>
							<div class="form-group">
								<label for="logo">Logo</label>
								<div class="preview-image-upload" id="logoImg">
									<img alt="${brandEntity.brandName}" src="<c:url value='/${brandEntity.logo}'/>">
								</div>
								<input type="file" class="form-control upload-image" name="logoFiles" accept="image/*">
								<input type="hidden" class="old-img" id="logo" name="logo" value="${brandEntity.logo}">
							</div>
							<div class="form-group">
								<label for="description">Description</label>
								<textarea rows="3" cols="30" name="description" id="description" class="form-control" placeholder="Description">${brandEntity.description}</textarea>
							</div>
						</div>	
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	
	
<script type="text/javascript" src="<c:url value='/plugins/bootstrap/bootstrap.js.css' />"></script>	
<script type="text/javascript" src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js' />"></script>	
<script type="text/javascript" src="<c:url value='/js/base.js' />"></script>			
</body>
</html>