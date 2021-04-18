<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/product/list">Control
			Product</a></li>
	<li class="breadcrumb-item active">Add Product</li>
</ol>
<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Sản Phẩm
	</div>
	<div class="card-body">
		<form  action="/admin/product/insert"
			enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label for="productName" class="font-weight-bold">Tên Sản
					Phẩm</label> <input type="text" class="form-control" id="productName" name="productName"
					placeholder="Nhập tên sản phẩm" required>
			</div>
			<div class="form-group">
				<label for="categoryId" class="font-weight-bold">Danh Mục</label> <select
					class="form-control" id="categoryId" name="categoryId">
					<c:forEach items="${listCategory}" var="category">
						<option value="${category.getCategoryId()}">${category.getCategoryName()}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="brandId">Thương Hiệu</label> <select
					class="form-control" id="brandId" name="brandId">
					<c:forEach items="${listBrand}" var="brand">
						<option value="${brand.getBrandId()}">${brand.getBrandName()}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="price">Giá Gốc</label> <input type="number" name="price"
					class="form-control" id="price">
			</div>

			<div class="form-group">
				<label for="salePrice">Giá Sale</label> <input type="number" name="salePrice"
					class="form-control" id="salePrice">
			</div>

			<div class="form-group">
				<label for="description">Mô Tả</label>
				<textarea class="form-control" id="description"  name="description" rows="10">${productDTO.getDescription()}</textarea>
			</div>
			<div class="form-group">
				<label for="imagesUrl">Thêm Ảnh:</label> <input
					class="form-control" type="file" multiple="multiple"
					class="form-control" name="imagesUrl" id="file-input"
					accept="image/png, image/jpeg"></input>
				<div id="previewonly"></div>
			</div>
			<div class="form-group"> 
				<label for="status">Trạng Thái</label> <select class="form-control" name="status"
					id="status">
					<c:forEach items="${listStatus}" var="status">
						<option value="${status.getStatusId()}">${status.getStatusName()}</option>
					</c:forEach>
				</select>
			</div>


			<div class="form-group">
				<button type="button" class="btn btn-primary float-left"
					onclick="window.location.href='/admin/product/list'">Back</button>
				<p id="msg" class="ml-4 pt-1 float-left"></p>
				<button type="submit" class="btn btn-primary mb-2 float-right"
					id="addNew">Tạo Mới</button>
			</div>
		</form>
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
<%-- <script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>
<script
	src="<c:url value='/template/admin/dist/assets/demo/datatables-demo.js'/>"></script> --%>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/insert-product.js'/>"></script>
