<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- CSS only -->
<link rel="stylesheet"
	href="<c:url value='/template/web/css/PagingOrderDetail.css'/>" />

<!-- Page of infomation of buy -->
<div class="container-fluid bg-light border-bottom py-5 buy-information">
	<div class="container position-relative " style="height: 44px;">
		<div class="d-flex align-items-center py-4 h-100 position-absolute ">
			<div class="nav-item nav-item-home">
				<a href="/home" class="nav-link buy-infor-header">Trang chủ </a>
			</div>
			<div class="item__pagination ml-3"></div>
			<div class="nav-item nav-item-infomation buy-infor-header">Đơn hàng của tôi</div>
		</div>
	</div>
	<div class="container mt-2">
		<div class="row order-infor">
			<div class="col-md-3 pt-4 ">
				<div class="d-flex w-100">
					<div class="block__img-customer">
						<img src="<c:url value='/uploads/images/${account.avatar}'/>" class="img__customer" alt=""
							srcset="">
					</div>
					<div class="name__customer ml-3">
						<h4>Tài khoản của</h4>
						<h3>${account.fullName}</h3>
					</div>
				</div>
				<div class="w-100 mt-3 ">
					<ul class="d-flex flex-wrap w-100 pl-0">
						<li class="w-100 py-3 px-2 font__size-3"><a href="/account/profile" class="buy-infor-headers"><i
								class="fas fa-user pr-5 font__size-4 buy-infor-header buy-infor-header"></i>Thông tin tài khoản</a></li>
						<li class="w-100 py-3 px-2 font__size-3"><a href="/account/order" class="buy-infor-headers"><i
								class="fas fa-tasks pr-5 font__size-4 buy-infor-header buy-infor-header"></i>Quản lý đơn hàng</a></li>
					</ul>
				</div>

			</div>
			<div class="col-md-9">
				<div class="w-100">
					<h3 class="card-title text-dark my-4">Đơn hàng của tôi</h3>
				</div>
				<div class="w-100 bg-white">
					<c:choose>
						<c:when test="${listOrder == null}">Bạn chưa có đơn hàng nào!</c:when>
						<c:otherwise>
							<div class="table-responsive">

								<table class="table table-borderless table-hover">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Ngày mua</th>
											<th>Sản phẩm</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
										</tr>
									<thead>
									<tbody id="listOrder">
										<c:forEach items="${listOrder}" var="order">
											<tr>
												<td class="text-dark"><a
													href="/account/order/${order.orderId}" class="text-warning">#${order.orderId}</a></td>
												<td>${order.dateCreated}</td>
												<td>${order.getName()}</td>
												<td>${order.getTotalPrice()}</td>
												<td>${order.statusName}</td>
											</tr>
										</c:forEach>
										<tr class="pt-5 mt-5"></tr>
									</tbody>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  -->
<!--  -->
<!-- /* Đăng ký thông tin */ -->
<!-- <div class="container ">
	<div class="navrbar__Signup-information bord-top">
		<h1 class="title-section">ĐĂNG KÝ NHẬN THÔNG TIN</h1>
		<div class="header__search navrbar__Signup-search">
			<div class="header__search-input-wrap">
				<input type="text" class="header__search-input search__text"
					placeholder="Email ...">
			</div>
			<button type="submit" class="header__search-btn">
				<i class="header__search-btn-icon fas fa-search"></i>
			</button>
		</div>
	</div>
</div> -->
<!-- /* end đăng ký */ -->

<!-- End container-private -->
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/jquery/order-paging.js'/>"></script>
<script type="text/javascript">
	$("#listOrder").JPaging();
</script>