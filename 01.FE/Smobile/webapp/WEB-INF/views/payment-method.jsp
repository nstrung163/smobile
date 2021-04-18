<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Method</title>
<link rel="stylesheet"
	href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
</head>
<body>
	<!-- <div><input type="text" id="keyword"><button class="btn btn-success" id="btnSearch">Search</button></div>
	<table id="pyamentMethodInfo">
		<thead>
			<tr>
				<th>Payment method Id:</th>
				<th>Payment method Name:</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div>
		<label>Name:<input id="paymentMethodName" type="text" placeholder="Enter name payment method"></label> 
		<button id="btnAddPayment" class="btn btn-success">Add</button>
	</div>
	
	<div>
	<h3>Update payment method</h3>
		<input id="paymentMethodIdUpdate" type="text" readonly="readonly">
		<label>Name:<input id="paymentMethodNameUpdate" type="text" placeholder="Enter name payment method"></label> 
		<button id="btnUpdatePayment" class="btn btn-primary">Update</button>
	</div> -->
	
	<div class="container col-md-12" style="display: flex;">
		<div class="col-md-6">
			<h3>Payment Method</h3>
			<table class="table table-hover" id="paymentMethodInfo">
				<thead class="thead-dark">
					<tr>
						<th scope="col" class="text-center">No</th>
						<th scope="col" class="text-center">Payment Method Name</th>
						<th scope="col" class="text-center">Action</th>
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
						<th scope="col" class="text-center">No</th>
						<th scope="col" class="text-center">Category Code</th>
						<th scope="col" class="text-center">Category Name</th>
						<th scope="col" class="text-center">Parent Category Id</th>
						<th scope="col" class="text-center">Action</th>
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
	<script src="<c:url value='/js/payment-method.js'/>"></script>
</body>
</html>