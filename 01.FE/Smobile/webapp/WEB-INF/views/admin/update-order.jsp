<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/order/list">Control
			Order</a></li>
	<li class="breadcrumb-item active">Update Order</li>
</ol>
<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Đơn Hàng
	</div>
	<div class="card-body">
		<form>
			<div class="form-group">
				<label for="orderId">ID Đơn Hàng</label> <input type="text"
					class="form-control" id="orderId"
					value="${orderDTO.getOrderId()}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="fullName">Người Mua</label> <input type="text"
					class="form-control" id="fullName"
					value="${orderDTO.getFullName()}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="dateCreated">Ngày Mua</label> <input type="text"
					class="form-control" id="dateCreated"
					value="${orderDTO.getDateCreated()}" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="paymentMethodName">Phương thức Thanh Toán</label>
				<input class="form-control" id="paymentMethodName" value="${orderDTO.getPaymentMethodName()}" readonly="readonly"/>
			</div>

			<div class="form-group">
				<label for="orderStatusId">Trạng Thái Đơn Hàng</label> <select class="form-control"
					id="orderStatusId">
					<c:forEach items="${listOrderStatus}" var="orderStatus">
						<c:if test="${orderStatus.getOrderStatusId() ==  orderDTO.getOrderStatusId()}">
							<option value="${orderStatus.getOrderStatusId()}" selected="selected">${orderStatus.getStatusName()}</option>
						</c:if>
						<c:if test="${orderStatus.getOrderStatusId() !=  orderDTO.getOrderStatusId()}">
							<option value="${orderStatus.getOrderStatusId()}">${orderStatus.getStatusName()}</option>
						</c:if>

					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<button type="button" class="btn btn-primary float-left"
					onclick="window.location.href='/admin/order/list'">Back</button>
				<p id="msg" class="ml-4 pt-1 float-left"></p>
				<button type="submit" class="btn btn-primary mb-2 float-right"
					id="update">Cập nhật</button>
			</div>


		</form>

	</div>
</div>
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/update-order.js'/>"></script>
