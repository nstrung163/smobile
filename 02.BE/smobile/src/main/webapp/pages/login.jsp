<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>Smoblie | Đăng nhập</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
	<section class="login-block">
        <div class="container">
            <div class="row">
                <div class="col-md-4 login-sec">
                    <h2 class="text-center">Đăng Nhập</h2>
                    <c:if test="${ errorMessage != null }">
	                    <div class="alert alert-danger">
			                <a class="close" data-dismiss="alert" href="#">×</a>${errorMessage}
			            </div>
                    </c:if>
                    <form action="/loginAction" method="POST" class="login-form">
                        <div class="form-group">
                            <label for="username" class="">Tên tài khoản:</label>
                            <input type="text" class="form-control" placeholder="Nhập tên tài khoản" name="username" required="required">

                        </div>
                        <div class="form-group">
                            <label for="password" class="">Mật khẩu:</label>
                            <input type="password" class="form-control" placeholder="Nhập mật khẩu" name="password" required="required">
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input">
                                <small>Nhớ mật khẩu</small>
                            </label>
                            <button type="submit" class="btn btn-login float-right">Đăng nhập</button>
                        </div>

                    </form>
                    <div class="copy-text"> Copyright <i class="far fa-copyright"></i>by Smobile</div>
                </div>
                <div class="col-md-8 banner-sec">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="<c:url value='/images/carousel/slide1.jpg'/>" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="<c:url value='/images/carousel/slide2.jpg'/>" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="<c:url value='/images/carousel/slide3.jpg'/>" alt="Third slide">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </section>
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
</body>
</html>
