<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/statistic/product">Product
			Statistic</a></li>
</ol>

<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-filter"></i> Bộ lọc
	</div>
	<div class="card-body">
		<form action="/admin/statistic/product/filter" method="get">
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<a href="/admin/statistic/product" class="btn btn-dark">Mọi thời
							điểm</a>
					</div>
					<div class="col-md-3">
						<select name="month" id="month" class="form-control">
							<option value="1">Tháng 1</option>
							<option value="2">Tháng 2</option>
							<option value="3">Tháng 3</option>
							<option value="4">Tháng 4</option>
							<option value="5">Tháng 5</option>
							<option value="6">Tháng 6</option>
							<option value="7">Tháng 7</option>
							<option value="8">Tháng 8</option>
							<option value="9">Tháng 9</option>
							<option value="10">Tháng 10</option>
							<option value="11">Tháng 11</option>
							<option value="12">Tháng 12</option>
						</select>
					</div>
					<div class="col-md-3">
						<select name="year" id="month" class="form-control">
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
						</select>
					</div>
					<div class="col-md-3">
						<button type="submit" class="btn btn-dark">Thống Kê</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-chart-line"></i> ${title}
	</div>
	<div class="card-body">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Sản Phẩm</th>
					<th scope="col">Doanh Số</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listProductStatistic}" var="productStatistic">
					<tr>
						<td>${productStatistic.productId}</td>
						<td>${productStatistic.productName}</td>
						<td>${productStatistic.quantityOfProduct}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" class="btn btn-dark float-right"
			onclick="window.location.href='/admin/home'">Back</button>
	</div>
</div>
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>