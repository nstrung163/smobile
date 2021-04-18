<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/template/web/css/PagingOrderDetail.css'/>" />
	
<style>
	.container {
		font-size: 1.5rem !important;
	}
</style>
<!-- page chi tiet hoa don -->
<div class="container-fluid bg-light border-bottom py-5 mb-5">
	<div class="container position-relative " style="height: 44px;">
		<div class="d-flex align-items-center py-4 h-100 position-absolute">
			<div class="nav-item nav-item-home">
				<a href="" class="nav-link buy-infor-header">Trang chủ</a>
			</div>
			<div class="item__pagination"></div>
			<div class="nav-item nav-item-infomation buy-infor-header">Đơn hàng của tôi</div>
		</div>
	</div>
	
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-3 mt-4">
				<div class="d-flex w-100">
					<div class="block__img-customer">
						<img src="<c:url value='/uploads/images/${account.avatar}'/>" class="img__customer" alt="" srcset="">
					</div>
					<div class="name__customer ml-3">
						<h4>Tài khoản của</h4>
						<h3>${account.fullName}</h3>
					</div>
				</div>
				<div class="w-100 mt-3">
					<ul class="d-flex flex-wrap w-100 pl-0">
						<li class="w-100 py-3 px-2 font__size-3"><a
							href="/account/profile" class="buy-infor-header"><i
								class="fas fa-user pr-5 font__size-4 buy-infor-headers"></i>Thông tin tài khoản</a></li>
						<li class="w-100 py-3 px-2 font__size-3"><a
							href="/account/order" class="buy-infor-headers"><i
								class="fas fa-tasks pr-5 font__size-4 buy-infor-header"></i>Quản lý đơn hàng</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9 col-sm-12">

				<div class="card mb-4 mt-3">
					<div class="card-header">

						<div class="w-100 d-flex justify-content-between mt-1">
							<h5 class="card-title">
								<i class="fas fa-table mr-1"></i> Chi Tiết Đơn Hàng: #<span
									id="orderId">${order.getOrderId()}</span>
							</h5>
							<h5 class="card-title">Ngày đặt hàng: ${order.getDateCreatedString()}</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-4">
								<div class="card h-100">
									<div class="card-body">
										<h5 class="card-title">Thông Tin Khách Hàng</h5>
										<p class="card-text">${order.getDeliveryTypeHtml()}</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="card h-100">
									<div class="card-body">
										<h5 class="card-title">Trạng Thái Đơn Hàng</h5>
										<p class="card-text">${order.orderStatus.statusName}</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="card h-100">
									<div class="card-body">
										<h5 class="card-title">Hình Thức Thanh Toán</h5>
										<p class="card-text w-100">${order.paymentMethod.paymentMethodName}</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Chi Tiết Đơn Hàng -->
						<div class="row mt-4">
							<div class="table-responsive">
								<table class="table table-borderless table-hover order-history" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Sản phẩm</th>
											<th>Số lượng</th>
											<th>Size</th>
											<th>Giá</th>
										</tr>
									</thead>
									<tbody id="data">
										<!-- Insert data with this type -->
										<c:choose>
											<c:when
												test="${order.listOrderDetail == null || order.listOrderDetail.isEmpty()}">
												<tr>
													<td colspan="5"><p align="center">Rỗng!</p></td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${order.listOrderDetail}"
													var="orderDetail">
													<tr>
														<td>${orderDetail.orderDetailId}</td>
														<td>${orderDetail.productDetail.product.productName}</td>
														<td>${orderDetail.quantity}</td>
														<td>${orderDetail.productDetail.quantity}</td>
														<td>${orderDetail.getLongSalePrice()}</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>

						<div class="form-group mt-4">
							<button type="button" class="btn btn-dark text-light float-right ml-2"
								onclick="window.location.href='/account/order'">Trở Lại</button>
							<c:if test="${order.orderStatus.orderStatusId == 1}"><button type="button" class="btn btn-danger text-light  float-right"
								onclick="window.location.href='/account/order/${orderId}/cancel'">Huỷ Đơn Hàng</button></c:if>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end page chi tiet hoa don -->