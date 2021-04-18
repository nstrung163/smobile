<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<link href="<c:url value='/template/admin/dist/css/styles.css'/>"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-dark">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-bold my-4">Kopiko Shop</h3>
								</div>
								<div class="card-body">
									<form method="post" action="login-check">
										<div class="form-group">
											<label class="small mb-1" for="username">Username</label> <input
												class="form-control py-4" id="username" name="username"
												type="text" placeholder="Nhập username" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="password">Mật khẩu</label> <input
												class="form-control py-4" id="password" name="password"
												type="password" placeholder="Nhập mật khẩu" />
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox">
												<input class="custom-control-input"
													id="rememberPasswordCheck" type="checkbox" name="remember-me" /> <label
													class="custom-control-label" for="rememberPasswordCheck">Remember
													me</label>
											</div>
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="/forget-password">Quên mật khẩu?</a>
											<input class="btn btn-dark" id="submit" type="submit" value="Đăng Nhập" />
										</div>
										<font color="red">${errorMessage}</font>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="/register">Chưa có tài khoản? Đăng ký!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-dark mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-white" >Copyright &copy; Kopiko 2020</div>
						<div>
							<a href="#" class="text-white">Privacy Policy</a> &middot; <a href="#" class="text-white">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	

	<%
	if (request.getParameter("error") != null) {
	%>
	<div style="color: red; margin: 10px 0px;">
		Login Failed!!!<br /> Reason :
		<%
	if (session != null) {
		Object attrSession = session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
		if (attrSession != null) {
	%>
		<p><%=attrSession%></p>
		<p><%=(((java.lang.RuntimeException) attrSession).getMessage())%></p>
		<%
		}
		}
		%>
	</div>
	<%
	}
	%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
</body>
</html>