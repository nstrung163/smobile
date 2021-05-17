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
    <meta name="description" content="Hệ thống quản lý điện thoại di động Smoble" />
    <meta name="author" content="NST" />
    <title>Trang chủ | Tùy Chọn Sản Phẩm</title>
    <link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/plugins/datatables/css/dataTables.bootstrap.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/datatables/css/dataTables.bootstrap4.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/datatables/css/buttons.dataTables.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/plugins/font-awesome/css/all.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/css/admin/styles.css'/>" rel="stylesheet" />
    <link href="<c:url value='/css/admin/admin-index.css'/>" rel="stylesheet">
</head>

<body class="sb-nav-fixed">
    <!-- HEADER -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="/admin/home"><span class="logo-home"></span></a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle">
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
                        <!-- Quản lý sản phẩm -->
                        <div class="sb-sidenav-menu-heading">Quản lý cửa hàng</div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
                                Quản lý sản phẩm
                            <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                            	<a class="nav-link" href="/admin/product-list"><i class="mr-2 fab fa-product-hunt"></i>Sản phẩm </a>
                                <a class="nav-link" href="/admin/product-image-list"><i class="mr-2 fas fa-images"></i>Hình ảnh sản phẩm</a>
                                <a class="nav-link" href="/admin/product-option-list"><i class="mr-2 fas fa-clone"></i>Tùy chọn sản phẩm</a>
                                <a class="nav-link" href="/admin/product-info-list"><i class="mr-2 fas fa-info-circle"></i>Thông tin chi tiết sản phẩm</a>
                            </nav>
                        </div>
                        <!-- Quản lý nhãn hiệu -->
                        <a class="nav-link" href="/admin/brand-list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-copyright"></i>
							</div> Quản lý nhãn hiệu
						</a>
						<!-- Quản lý bán hàng -->
                        <a class="nav-link" href="/admin/purchase-detail-list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-shopping-cart"></i>
							</div> Quản lý bán hàng
						</a>
						<!-- Quản lý đánh giá và bình luận -->
                        <a class="nav-link" href="/admin/comment-list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-comments"></i>
							</div> Quản lý đánh giá bình luận
						</a>
						<!-- Quản lý tài khoản -->
                        <a class="nav-link" href="/admin/user-list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-user-circle"></i>
							</div> Quản lý tài khoản
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
                                 <a class="nav-link" href="/admin/statistic/purchase">Theo hóa đơn</a>
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
                        <li class="breadcrumb-item"><a href="/admin/home">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="/admin/product-list">Quản lý sản phẩm</a></li>
                        <li class="breadcrumb-item active">Tùy chọn sản phẩm</li>
                    </ol>
                    <h4 >Quản Lý Tùy Chọn Sản Phẩm</h4>
                    <!-- Alert -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i> Thông tin ảnh tùy chọn sản phẩm
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="dataTable" style="width: 100%">
                                    <thead data-detail-formatter="detailFormatter">
                                        <tr id="list-header">
                                            <th>No</th>
                                            <th>Màu Sản Phẩm</th>
                                            <th>Bộ Nhớ Trong</th>
                                            <th>Giá Bán</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Hình Ảnh</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Màu Sản Phẩm</th>
                                            <th>Bộ Nhớ Trong</th>
                                            <th>Giá Bán</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Hình Ảnh</th>
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
								<h5 class="modal-title">Thêm Tùy Chọn Sản Phẩm</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form action="" method="POST" id="productOptionInfoForm" enctype="multipart/form-data">
									<div class="form-group">
										<label for="productOptionId">Mã Tùy Chọn Sản Phẩm: </label>
										<input type="number" class="form-control" id="productOptionId" name="productOptionId" readonly="readonly" required="required" >
									</div>
									<div class="form-group">
										<label for="colorProductName">Màu Sản Phẩm: </label>
										<input type="text" class="form-control" id="colorProductName" name="colorProductName" required="required" >
									</div>
									<div class="group-row">
										<div class="form-group memory-product">
											<label for="memoryProduct">Bộ Nhớ Trong: </label>
											<input type="number" class="form-control" id="memoryProduct" name="memoryProduct" required="required" >
										</div>
										<div class="form-group">
											<label for="salePrice">Giá Bán: </label>
											<input type="number" class="form-control" id="salePrice" name="salePrice" required="required" >
										</div>
									</div>
									<div class="form-group">
										<label for="productEntity">Tên Sản Phẩm:</label>
										<select class="form-control" id="productId" name="productEntity.productId">
											<!-- <option disabled="disabled" selected="selected">Vui lòng chọn tên sản phẩm</option> -->
											<c:forEach items="${productList}" var="product">
												<option value="${product.productId}" class="form-select">${product.productName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="imageUrl">Hình ảnh: <span class="required-field">(*)</span></label>
										<div class="preview-image-upload" id="image">
											<img src="<c:url value='/images/image-demo.png'/>" alt="image">
										</div>
										<input type="file" class="form-control upload-image" name="imageFile" accept="image/*"/>
										<input type="hidden" class="old-img" id="imageUrl" name="imageUrl">
									</div>
									<button type="submit" class="btn btn-primary" id="btnSubmitProductOption">Cập nhật</button>
								</form>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Delete category -->
				<div class="modal fade" id="confirmDeleteModal" >
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xóa Tùy Chọn Sản Phẩm</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Bạn có muốn xóa tùy chọn của sản phẩm <b id="deleteProductName"></b>?</p>
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
    <script src="<c:url value='/js/admin/product-option.js'/>"></script>
</body>
</html>