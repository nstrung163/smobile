<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/account/list">Control
			Account</a></li>
	<li class="breadcrumb-item active">Update Account</li>
</ol>
<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Account
	</div>
	<div class="card-body">
		<form>
			<div class="form-group">
				<label for="accountId">ID Account</label> <input type="text"
					class="form-control" id="accountId"
					value="${accountDTO.getAccountId()}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="username">User name</label> <input type="text"
					class="form-control" id="username"
					value="${accountDTO.getUsername()}">
			</div>
			<div class="form-group">
				<label for="fullName">Full Name</label> <input type="text"
					class="form-control" id="fullName"
					value="${accountDTO.getFullName()}">
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					class="form-control" id="address"
					value="${accountDTO.getAddress()}">
			</div>
			<div class="form-group">
				<label for="phone">Phone:</label> <input type="text"
					class="form-control" id="phone" value="${accountDTO.getPhone()}">
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="text"
					class="form-control" id="email" value="${accountDTO.getEmail()}">
			</div>
			<div class="form-group">
				<label for="status">Status <strong>(Ẩn: 0 , Hiện:
						1)</strong></label> <select class="form-control" id="status" name="status">
					<c:if test="${accountDTO.getStatus() != null}">
						<option>${accountDTO.getStatus()}</option>
					</c:if>
					<c:if test="${accountDTO.getStatus() == 1}">
						<option>0</option>
					</c:if>
					<c:if test="${accountDTO.getStatus() == 0}">
						<option>1</option>
					</c:if>
				</select>

			</div>
			<div class="form-group">
				<label for="password">PassWord:</label> <input type="password"
					class="form-control" id="password"
					value="${accountDTO.getPassword()}">
			</div>
			<div class="form-group">
				<label for="brandId">Role</label> <select class="form-control"
					id="role" name="role">
					<c:if test="${accountDTO.getRole() != null}">
						<option>${accountDTO.getRole()}</option>
					</c:if>
					<c:if test="${accountDTO.getRole() == 'ADMIN'}">
						<option>USER</option>
					</c:if>
					<c:if test="${accountDTO.getRole() == 'USER'}">
						<option>ADMIN</option>
					</c:if>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary float-left"
					onclick="window.location.href='/admin/account/list'">Back</button>
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
<script src="<c:url value='/template/admin/js/update-account.js'/>"></script>
