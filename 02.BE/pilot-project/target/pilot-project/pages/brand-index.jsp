<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Brand Management</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/brand.css'/>">
</head>
<body>
	<div class="container">
		<div class="sub-header">
			<div class="float-left sub-title">Brand Management</div>
			<div class="float-right"><a class="btn btn-success add-btn" href="/brand/add"><i class="fas fa-plus-square"></i> Add Brand</a></div>
		</div>
		<table class="table table-bordered" id="brandInfoTable">
			<thead>
				<tr class="text-center">
					<th scope="col">STT</th>
					<th scope="col">Name</th>
					<th scope="col">Logo</th>
					<th scope="col">Description</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brand" items="${brandsList}">
					<tr>
						<td>${brand.brandId}</td>
						<td>${brand.brandName}</td>
						<td class="text-center"><img src="${brand.logo}"></td>
						<td>${brand.description}</td>
						<td class="action-btns" data-id="${brand.brandId}"><a class="edit-btn" href="/brand/update?id=${brand.brandId}"><i class="fas fa-edit"></i></a> | <a class="delete-btn" href="/brand/delete?id=${brand.brandId}"><i class="fas fa-trash-alt"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<script type="text/javascript" src="<c:url value='/plugins/bootstrap/bootstrap.js.css' />"></script>	
<script type="text/javascript" src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js' />"></script>	
<script type="text/javascript" src="<c:url value='/js/base.js' />"></script>		
</body>
</html>