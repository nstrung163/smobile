<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/order/list">Control
			Order</a></li>
	<li class="breadcrumb-item active">Order Detail</li>
</ol>

<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Chi Tiết Đơn Hàng: #<span
			id="orderId">${order.getOrderId()}</span>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-sm-4">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">Thông Tin Khách Hàng</h5>
						<p class="card-text">Họ tên:
							${order.getAccount().getFullName()}</p>
						<p class="card-text">SĐT: ${order.getAccount().getPhone()}</p>
						<p class="card-text">Địa Chỉ: ${order.getDeliveryInfo()}</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">Trạng Thái Đơn Hàng</h5>
						<select class="form-control" id="orderStatusId">
							<c:forEach items="${listOrderStatus}" var="orderStatus">
								<c:if
									test="${orderStatus.getOrderStatusId() ==  order.getOrderStatus().getOrderStatusId()}">
									<option value="${orderStatus.getOrderStatusId()}"
										selected="selected">${orderStatus.getStatusName()}</option>
								</c:if>
								<c:if
									test="${orderStatus.getOrderStatusId() !=  order.getOrderStatus().getOrderStatusId()}">
									<option value="${orderStatus.getOrderStatusId()}">${orderStatus.getStatusName()}</option>
								</c:if>

							</c:forEach>
						</select>



						<div class="form-group">

							<p id="msg" class="ml-4 pt-1 float-left"></p>
							<button type="button"
								class="btn btn-primary mb-2 mt-2 float-right"
								id="updateOrderStatus">Cập Nhật</button>

						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">Hình Thức Thanh Toán</h5>
						<p class="card-text w-100">${order.getPaymentMethod().getPaymentMethodName()}</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Chi Tiết Đơn Hàng -->
		<div class="row mt-4">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Order Detail ID</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Size</th>
							<th>Sale Price</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Order Detail ID</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Size</th>
							<th>Sale Price</th>
						</tr>
					</tfoot>
					<tbody id="data">
						<!-- Insert data with this type -->
						<!-- <tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr> -->
					</tbody>
				</table>
			</div>
		</div>

		<div class="form-group mt-4">
			<button type="button" class="btn btn-primary float-right"
				onclick="window.location.href='/admin/order/list'">Back</button>
		</div>

	</div>
</div>

<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<%-- <script src="<c:url value='/template/admin/js/update-order.js'/>"></script> --%>
<script src="<c:url value='/template/admin/js/order-detail.js'/>"></script>