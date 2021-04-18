<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item active">Control Product</li>
</ol>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> DataTable
	</div>
	<div class="card-body">
		<a href="/admin/product/new" class="btn btn-success mb-3">Thêm Sản Phẩm</a>
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Brand ID</th>
						<th>Category ID</th>
						<th>Date Created</th>
						<th>Price</th>
						<th>Sale Price</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Brand ID</th>
						<th>Category ID</th>
						<th>Date Created</th>
						<th>Price</th>
						<th>Sale Price</th>
						<th>Status</th>
						<th>Action</th>
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
</div>
<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<%-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script
	src="<c:url value='/template/admin/dist/assets/demo/chart-area-demo.js'/>"></script>
<script
	src="<c:url value='/template/admin/dist/assets/demo/chart-bar-demo.js'/>"></script> --%>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	></script>
<%-- <script
	src="<c:url value='/template/admin/dist/assets/demo/datatables-demo.js'/>"></script> --%>
<script src="<c:url value='/template/admin/js/product.js'/>"></script>


