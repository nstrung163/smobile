<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Smobile | Đăng nhâp</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/login.css'/>" rel="stylesheet" />
  </head>
  <body>
    <div class="container">
      <div class="sign-up-area">
        <div class="box-login">
          <span class="logo"></span>
          <div class="box-login__header">
            <h5>Đăng nhập vào Smobile</h5>
          </div>
          <c:if test="${ errorMessage != null }">
                <div class="alert alert-danger">
                    <a class="close" data-dismiss="alert" href="#">×</a>${ errorMessage }
                </div>
           </c:if>
          <div class="box-login__body">
            <form class="form-login" action="/loginAction" method="POST">
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name="username" id="username" placeholder="Nhập tên tài khoản"/>
              </div>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" name="password" id="password" placeholder="Nhập mật khẩu"/>
              </div>
              <!-- <div class="row align-items-center remember">
						<input type="checkbox">Ghi nhớ mật khẩu
					</div> -->
              <div class="form-group">
                <button type="submit" id="btnSubmit" class="btn btn-primary"> Đăng nhập</button>
              </div>
            </form>
            <div class="forget-register">
                <a class="forget-register__links" href="#">Quên mât khẩu?</a>
                <a class="forget-register__links" href="/user/register" >Đăng ký tài khoản</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
    <script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
  </body>
</html>
