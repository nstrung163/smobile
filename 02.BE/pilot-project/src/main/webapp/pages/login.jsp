<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Pilot Project</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
	<div class="nav-bg">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-expand-lg navbar-light logo">
				  <a class="navbar-brand">PILOT PROJECT</a>
				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<aside class="col-sm-4 form-login">
				<div class="card">
					<article class="card-body">
						<h4 class="card-title mb-4 mt-1">Login</h4>
						<h4 style="color: red;">${errormessage}</h4>
						<form action="/loginAction"  method=POST>
							<div class="form-group">
								<label>Username</label> 
								<input name="username" class="form-control" placeholder="Enter Username" type="text" required="required">
							</div>
							<div class="form-group">
								<label>Password</label> 
								<input class="form-control" name="password" placeholder="Enter Password" type="password" required="required">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block btn-login">Sign in</button>
							</div>
						</form>
					</article>
				</div>
			</aside>
		</div>
	</div>
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
</body>
</html>
