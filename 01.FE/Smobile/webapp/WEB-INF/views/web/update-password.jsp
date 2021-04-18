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
									<form method="post" action="/account/change-password">
										<div class="form-group">
											<label class="small mb-1" for="password">Mật khẩu cũ</label>
											<input class="form-control py-4" id="password"
												name="password" type="text" placeholder="Nhập password"
												required="required" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="password">Mật khẩu mới</label>
											<input class="form-control py-4" id="newPassword"
												name="newPassword" type="password"
												placeholder="Nhập mật khẩu mới" required="required" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="password">Xác nhận mật
												khẩu mới</label> <input class="form-control py-4"
												id="check-newPassword" type="password"
												placeholder="Nhập lại mật khẩu mới" required="required" />
										</div>
										<button type="submit">Cập Nhật</button>
										<font color="red">${message}</font>
									</form>
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
						<div class="text-white">Copyright &copy; Kopiko 2020</div>
						<div>
							<a href="#" class="text-white">Privacy Policy</a> &middot; <a
								href="#" class="text-white">Terms &amp; Conditions</a>
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