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
		<div id="layoutAuthentication_content" class="mb-4">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Kopiko Shop</h3>
								</div>
								<div class="card-body">
									<form method="post" action="register">
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="username">Username</label> <input
														class="form-control py-4" id="username" name="username"
														type="text" placeholder="Nhập username" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="fullName">Họ Tên</label> <input
														class="form-control py-4" id="fullName" name="fullName"
														type="text" placeholder="Nhập email" />
												</div>
											</div>
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="phone">SĐT</label> <input
														class="form-control py-4" id="phone" name="phone"
														type="text" placeholder="Nhập số điện thoại" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="email">Email</label> <input
														class="form-control py-4" id="email" name="email"
														type="email" aria-describedby="emailHelp"
														placeholder="Nhập email" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="address">Địa Chỉ</label> <input
												class="form-control py-4" id="address" name="address"
												type="text" placeholder="Nhập địa chỉ" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="password">Mật Khẩu</label> <input
														class="form-control py-4" id="password" name="password"
														type="password" placeholder="Nhập password" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputConfirmPassword">Xác
														Nhận Mật Khẩu</label> <input class="form-control py-4"
														id="inputConfirmPassword" type="password"
														placeholder="Nhập lại password" />
												</div>
											</div>
										</div>
										<div class="form-group mt-4 mb-0">
											<button type="submit" class="btn btn-dark btn-block">Tạo
												Tài Khoản</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="login">Đã có tài khoản? Mời đăng nhập</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted text-light">Copyright &copy; Kopiko Shop 2020</div>
						<div>
							<a href="#" class="text-light">Privacy Policy</a> &middot; <a href="#" class="text-light">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
</body>
</html>