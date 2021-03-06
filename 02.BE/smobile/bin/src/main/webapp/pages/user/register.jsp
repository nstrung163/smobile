<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Smobile | Đăng ký</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/user/register.css'/>" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <div class="sign-up-area">
        <div class="box-login">
          <span class="logo"></span>
          <div class="box-login__header">
            <h5>Đăng ký tài khoản để trở thành thành viên của Smobile</h5>
          </div>
          <div class="box-login__body">
            <form class="form-login" action="" method="POST">
              <div class="form-login-content">
                  <div class="form-login__left">
                    <div class="form-group">
                        <label for="fullName">Họ và tên:</label>
                        <input type="text" name="fullName" id="fullName" class="form-control" placeholder="Nhập vào họ và tên" >
                      </div>
                      <div class="group-form">
                        <div class="form-group">
                            <label for="phoneNumber">Số điện thoại:</label>
                            <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" placeholder="Nhập vào số điện thoại" >
                          </div>
                          <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Nhập vào email" >
                          </div>
                      </div>
                      <div class="form-group">
                        <label for="avatarUrl">Ảnh đại diện:</label>
                        <input type="file" name="avatarUrl" id="avatarUrl" class="form-control">
                      </div>
                  </div>
                  <div class="form-login__right">
                    <div class="group-form">
                        <div class="form-group">
                            <label for="birthday">Ngày sinh:</label>
                            <input type="date" name="birthday" id="birthday" class="form-control" >
                          </div>
                        <div class="form-group">
                            <label for="gender">Giới tính:</label>
                            <div class="radio-gender">
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="gender">Nam
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="gender">Nữ
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="gender">Khác
                                    </label>
                                </div>
                            </div>
                        </div>
                      </div>
                      <div class="group-form">
                        <div class="form-group">
                            <label for="username">Tên đăng nhập:</label>
                            <input type="text" name="username" id="username" class="form-control" placeholder="Nhập vào tên đăng nhập" >
                          </div>
                          <div class="form-group">
                            <label for="password">Mật khẩu:</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Nhập vào mật khẩu" >
                          </div>
                      </div>
                 </div>
              </div>
              <div class="submit-area">
                <button type="submit" id="btnSubmit" class="btn btn-success"> Đăng ký</button>
              </div>
            </form>
            <div class="forget-register">
                <a href="/login" role="button" class="forget-register__links btn btn-primary">Đăng nhập</a>
                <a href="/home" role="button" class="forget-register__links btn btn-danger">Trở lại</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>