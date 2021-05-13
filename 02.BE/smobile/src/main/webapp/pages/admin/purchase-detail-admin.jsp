<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hệ thống quản lý điện thoại di động Smobile" />
    <meta name="author" content="NST" />
    <title>Trang chủ</title>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/plugins/datatables/css/dataTables.bootstrap.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/datatables/css/dataTables.bootstrap4.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/datatables/css/buttons.dataTables.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/css/admin/styles.css'/>" rel="stylesheet" />
    <link href="<c:url value='/css/admin/admin-index.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/admin/purchase-detail-admin.css'/>" rel="stylesheet">
</head>

<body class="sb-nav-fixed">
    <!-- HEADER -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="/admin/home"><span class="logo-home"></span></a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 btn-change-width" id="sidebarToggle">
            <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
                <div class="input-group-append">
                </div>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user fa-fw"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">Cài đặt</a> 
                    <a class="dropdown-item" href="#">Hoạt động đăng nhập</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/logout">Đăng xuất</a>
                </div>
            </li>
        </ul>
    </nav>
    <!-- END HEADER -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <!-- HEADER -->
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <!-- Giới thiệu -->
                        <div class="sb-sidenav-menu-heading">Giới thiệu</div>
                        <a class="nav-link" href="/admin/home">
                            <span class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></span> Trang chủ
                        </a>
                        <!-- Quản lý danh mục -->
                        <div class="sb-sidenav-menu-heading">Quản lý cửa hàng</div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
                                Quản lý danh mục
                            <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                            	<a class="nav-link" href="/admin/brand-list"><i class="mr-2 fas fa-copyright"></i>Nhãn hiệu </a>
                            	<a class="nav-link" href="/admin/product-list"><i class="mr-2 fab fa-product-hunt"></i>Sản phẩm </a>
                                <a class="nav-link" href="/admin/product-image-list"><i class="mr-2 fas fa-user-circle"></i>Hình ảnh sản phẩm</a>
                                <a class="nav-link" href="/admin/product-option-list"><i class="mr-2 fas fa-star-half-alt"></i>Loại sản phẩm</a>
                                <a class="nav-link" href="/admin/product-info-list"><i class="mr-2 fas fa-star-half-alt"></i>Thông tin chi tiết sản phẩm</a>
                                <a class="nav-link" href="/admin/user-list"><i class="mr-2 fas fa-user-circle"></i>Tài khoản</a>
                                <a class="nav-link" href="/admin/comment-list"><i class="mr-2 fas fa-comments"></i>Bình luận</a>
                                <a class="nav-link" href="/admin/rate-list"><i class="mr-2 fas fa-comments"></i>Đánh giá</a>
                                <a class="nav-link" href="/admin/news-list"><i class="mr-2 fas fa-comments"></i>Tin tức</a>
                            </nav>
                        </div>
                        <!-- Quản lý bán hàng -->
                        <a class="nav-link" href="/admin/purchase-detail-list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-shopping-cart"></i>
							</div> Quản lý bán hàng
						</a> 
                        <!-- Thống kê -->
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseStatistic" aria-expanded="false" aria-controls="collapseStatistic">
                            <span class="sb-nav-link-icon">
                                <i class="fas fa-chart-line"></i>
                            </span> Thống kê
                            <span class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down"></i>
                            </span>
                        </a>
                        <div class="collapse" id="collapseStatistic" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/admin/statistic/product">Theo sản phẩm</a>
                                 <a class="nav-link" href="/admin/statistic/order">Theo hóa đơn</a>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Xin chào quản trị viên:</div>
                    	<sec:authentication var="user" property="principal" />
						<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
							${user.fullName}
						</sec:authorize>
                </div>
            </nav>
            <!-- END HEADER -->
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <!-- BODY -->
                    <ol  class="breadcrumb mb-4 mt-4">
                        <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Bán Hàng</li>
                    </ol>
                    <h3 >Quản Lý Bán Hàng</h3>
                    <div id="announcemnet" role="alert" aria-live="assertive" aria-atomic="true" class="toast"
                        data-animation="true" data-autohide="true" data-delay="3000"
                        style="position: absolute; top: 70px; right: 30px; z-index: 100000;">
                        <div class="toast-header alert-success">
                            <strong class="mr-auto text-success">Thông báo</strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                            <strong id="notification">Thành công</strong>
                        </div>
                    </div>
                    <!-- Alert -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i> Thông tin hóa đơn
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="dataTable" style="width: 100%">
                                    <thead data-detail-formatter="detailFormatter">
                                        <tr id="list-header">
                                            <th>Mã HĐCT</th>
                                            <th>Hình ảnh sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá bán</th>
                                            <th>Số lượng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Người mua</th>
                                            <th>Trạng thái</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                          <th>Mã hóa đơn CT</th>
                                          <th>Hình ảnh sản phẩm</th>
                                          <th>Tên sản phẩm</th>
                                          <th>Giá bán</th>
                                          <th>Số lượng</th>
                                          <th>Ngày đặt hàng</th>
                                          <th>Người mua</th>
                                          <th>Trạng thái</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                   <div class="modal fade" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h5 class="modal-title">Duyệt Đơn Hàng</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form  action="" method="POST" id="purchaseDetailInfoForm" enctype="multipart/form-data">
									<div class="purchase-detail">
										<div class="purchase-detail__left">
											<div class="image-product-area">
												<div class="form-group ">
													<label for="logo">Hình sản phẩm: <span class="required-field">(*)</span></label>
													<div class="preview-image-upload" id="logoImg">
														<img src="<c:url value='/images/image-demo.png'/>" alt="image">
													</div>
													<!-- <input type="file" class="form-control upload-image" name="logoFile" readonly="readonly" accept="image/*" /> -->
													<input type="hidden" class="old-img" id="logo" name="logo">
												</div>
											</div>
											<div class="group-row-right">
												<div class="form-group">
													<label for="purchaseId">Mã Hóa Đơn: </label>
													<input type="number" class="form-control" id="purchaseId" name="purchaseId" readonly="readonly" required="required" >
												</div>
												<div class="form-group">
													<label for="purchaseDetailId">Mã Chi Tiết Hóa Đơn: </label>
													<input type="number" class="form-control" id="purchaseDetailId" name="purchaseDetailId" readonly="readonly" required="required" >
												</div>
											</div>
										</div>
										<div class="purchase-detail__right">
											<div class="form-group">
												<label for="productName">Tên Sản Phẩm: </label>
												<input type="text" class="form-control" id="productName" name="productName" readonly="readonly" required="required" >
											</div>
											<div class="group-row">
												<div class="form-group">
													<label for="salePrice">Giá Bán: </label>
													<input type="number" class="form-control" id="salePrice" name="salePrice" readonly="readonly" required="required" >
												</div>
												<div class="form-group">
													<label for="quantity">Số Lượng: </label>
													<input type="number" class="form-control" id="quantity" name="quantity" readonly="readonly" required="required" >
												</div>
											</div>
											<div class="group-row">
												<div class="form-group">
													<label for="dateOfOrder">Ngày Đặt Hàng: </label>
													<input type="date" class="form-control" id="dateOfOrder" name="dateOfOrder" readonly="readonly" required="required" >
												</div>
												<div class="form-group">
													<label for="fullName">Người Mua: </label>
													<input type="text" class="form-control" id="fullName" name="fullName" readonly="readonly" required="required" >
												</div>
											</div>
											<div class="form-group">
												<label for="brandEntity">Trạng Thái: </label>
												<select class="form-control" id="purchaseStatusName" name="purchaseStatusName">
													<option class="selected" value="">Chọn trạng thái đơn hàng</option>
													<c:forEach items="${purchaseStatusList}" var="purchaseStatus">
														<option value="${purchaseStatus.purchaseStatusId}" class="form-select purchase-status-name">${purchaseStatus.purchaseStatusName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="btn-box">
										<button type="submit" class="btn btn-primary" id="btnSubmitPurchaseDetail">Cập nhật</button>
										<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Delete category -->
				<div class="modal fade" id="confirmDeleteModal" >
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xóa Hóa Đơn</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Bạn có muốn xóa hóa đơn có sản phẩm <b id=deletePurchaseDetailId> trong giỏ hàng</b>?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
								<button type="button" class="btn btn-primary" id="btnSubmitDelete">Xác nhận</button>
							</div>
						</div>
					</div>
				</div>
                    <!-- END BODY -->
                </div>
            </main>
            <!-- FOOTER -->
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Smobile 2021</div>
                        <div>
                            <a href="#">Chính sách bảo mật</a> &middot; <a href="#">Điều khoản &amp; Điều kiện</a>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- END FOOTER -->
        </div>
    </div>
    <script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
    <script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/plugins/datatables/js/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/plugins/datatables/js/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/plugins/datatables/js/dataTables.bootstrap4.min.js'/>"></script>
    <script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
	<script src="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.js'/>"></script>
    <script src="<c:url value='/js/admin/scripts.js'/>"></script>
    <script src="<c:url value='/js/base.js'/>"></script>
    <script src="<c:url value='/js/admin/purchase-detail-admin.js'/>"></script>
</body>
</html>