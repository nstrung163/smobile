<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/product/list">Control
			Product</a></li>
	<li class="breadcrumb-item active">Update Product</li>
</ol>
<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Sản Phẩm
	</div>
	<div class="card-body">
		<form action="/admin/product/${productDTO.getProductId() }/edit"
			enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label for="productId">ID Sản Phẩm</label> <input type="text"
					class="form-control" id="productId" name="productId"
					value="${productDTO.getProductId()}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="productName">Tên Sản Phẩm</label> <input type="text"
					name="productName" class="form-control" id="productName"
					value="${productDTO.getProductName()}">
			</div>
			<div class="form-group">
				<label for="categoryId">Danh Mục</label> <select
					class="form-control" id="categoryId" name="categoryId">
					<c:forEach items="${listCategory}" var="category">
						<c:if
							test="${productDTO.getCategoryId() ==  category.getCategoryId()}">
							<option value="${category.getCategoryId()}" selected="selected">${category.getCategoryName()}</option>
						</c:if>
						<c:if
							test="${productDTO.getCategoryId() !=  category.getCategoryId()}">
							<option value="${category.getCategoryId()}">${category.getCategoryName()}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="brandId">Thương Hiệu</label> <select
					class="form-control" id="brandId" name="brandId">
					<c:forEach items="${listBrand}" var="brand">
						<c:if test="${productDTO.getBrandId() ==  brand.getBrandId()}">
							<option value="${brand.getBrandId()}" selected="selected">${brand.getBrandName()}</option>
						</c:if>
						<c:if test="${productDTO.getBrandId() !=  brand.getBrandId()}">
							<option value="${brand.getBrandId()}">${brand.getBrandName()}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="price">Giá Gốc</label> <input type="number"
					class="form-control" id="price" name="price"
					value="${productDTO.getPrice()}">
			</div>

			<div class="form-group">
				<label for="salePrice">Giá Sale</label> <input type="number"
					name="salePrice" class="form-control" id="salePrice"
					value="${productDTO.getSalePrice()}">
			</div>

			<div class="form-group">
				<label for="description">Mô Tả</label>
				<textarea class="form-control" id="description" rows="10"
					name="description">${productDTO.getDescription()}</textarea>
			</div>
			<div class="form-group">
				<label for="">List Ảnh</label>
				<div>
					<c:forEach items="${productDTO.getListImgUrl() }"
						var="productImageUrl">
						<img style="width: auto; height: 200px; margin: 10px;"
							src="<c:url value='/uploads/images/${ productImageUrl}'/>">
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<label for="imagesUrl">Thêm Ảnh</label> <input class="form-control"
					type="file" multiple="multiple" class="form-control"
					name="imagesUrl" id="file-input" accept="image/png, image/jpeg"></input>
				<div id="previewonly"></div>
			</div>
			<div class="form-group">
				<label for="size">Chi tiết</label>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ProductDetailID</th>
							<th scope="col">Size</th>
							<th scope="col">Quantity</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listProductDetail }" var="productDetail">
							<tr>
								<th scope="row">${productDetail.getProductDetailId() }</th>
								<td>${productDetail.getSize() }</td>
								<td>${productDetail.getQuantity() }</td>
								<td>
									<button type="button" class="btn btn-info btn-danger delete" id="${productDetail.getProductDetailId() }">Delete</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row border align-items-center mt-5 p-3">
				<div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2">
					<p class="font-weight-bold m-0">Edit ProductDetail</p>
				</div>
				<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3 d-flex">
					<label class="font-weight-bold m-0 mr-2 d-flex  align-items-center">Size</label>
					<input class="form-control" type="text" id="size" name="size">
				</div>
				<div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4 d-flex">
					<label class="font-weight-bold m-0 mr-2 d-flex align-items-center">Quantiy</label>
					<input class="form-control" type="number" id="quantity"
						name="quantity">
				</div>
				<div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 text-center">
					<button class="btn btn-success" id="updateProductDetail">Update
					</button>
					<p id="msgdt" class="ml-4 pt-1 float-left"></p>
				</div>
			</div>
			<div class="form-group">
				<label for="status">Trạng Thái</label> <select class="form-control"
					id="status" name="status">
					<c:forEach items="${listStatus}" var="status">
						<c:if test="${status.getStatusId() ==  productDTO.getStatus()}">
							<option value="${status.getStatusId()}" selected="selected">${status.getStatusName()}</option>
						</c:if>
						<c:if test="${status.getStatusId() !=  productDTO.getStatus()}">
							<option value="${status.getStatusId()}">${status.getStatusName()}</option>
						</c:if>

					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<button type="button" class="btn btn-primary float-left"
					onclick="window.location.href='/admin/product/list'">Back</button>
				<p id="msg" class="ml-4 pt-1 float-left"></p>
				<button type="submit" class="btn btn-primary mb-2 float-right">Lưu</button>
			</div>


		</form>
	</div>
</div>


<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/update-product.js'/>"></script>
