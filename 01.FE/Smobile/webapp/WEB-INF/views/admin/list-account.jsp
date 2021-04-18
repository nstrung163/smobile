<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item active">Control Account</li>
</ol>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> DataTable
	</div>
	<div class="card-body">
		<a href="/admin/account/create" class="btn btn-success mb-3">Thêm tài khoản</a>
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>Account ID</th>
						<th>User Name</th>
						<th>Full Name</th>
						<!-- <th>Avatar</th>
						<th>Role</th> -->
						<th>Address</th>
						<th>Phone</th>
						<th>Email</th>
						<!-- <th>Status</th> -->
						<th>DateCreated</th>
						<th>Action</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>Account ID</th>
						<th>User Name</th>
						<th>Full Name</th>
						<!-- <th>Avatar</th>
						<th>Role</th> -->
						<th>Address</th>
						<th>Phone</th>
						<th>Email</th>
						<!-- <th>Status</th> -->
						<th>DateCreated</th>
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
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
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
<script src="<c:url value='/template/admin/js/account.js'/>"></script>


