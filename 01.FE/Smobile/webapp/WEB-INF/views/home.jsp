<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
</head>
<body>
	<div class="container col-md-12">
		<div class="col-md-6">
			<h3>Payment Method</h3>
			<table class="table table-hover" id="paymentMethodInfo">
				<thead class="thead-dark">
					<tr>
						<th scope="col">No</th>
						<th scope="col">Payment Method Name</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div class="col-md-6">
			<h3>Category</h3>
			<table class="table table-hover" id="categoryInfo">
				<thead class="thead-dark">
					<tr>
						<th scope="col">No</th>
						<th scope="col">Category Code</th>
						<th scope="col">Category Name</th>
						<th scope="col">Parent Category Id</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
	<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
	<script src="<c:url value='/js/home-page.js'/>"></script>
</body>
</html>