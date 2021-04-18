<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/template/web/css/PagingOrderDetail.css'/>" />
	
<!-- Page of infomation of customer -->
<div class="container-fluid bg-light border-bottom py-5">
	<div class="container position-relative " style="height: 44px;">
		<div class="d-flex align-items-center py-4 h-100 position-absolute">
			<div class="nav-item nav-item-home">
				<a href="/home" class="nav-link buy-infor-header">Trang chủ</a>
			</div>
			<div class="item__pagination"></div>
			<div class="nav-item nav-item-infomation buy-infor-header">Thông tin khách hàng</div>
		</div>
	</div>
	<div class="container mt-2">
		<div class="row">
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
				<div class="w-100 mt-3">
					<ul class="d-flex flex-wrap w-100 pl-0">
						<li class="w-100 py-3 px-2 font__size-3"><a href="/account/profile" class="buy-infor-headers"><i
								class="fas fa-user pr-5 font__size-4 buy-infor-header"></i>Thông tin tài khoản</a></li>
						<li class="w-100 py-3 px-2 font__size-3"><a href="/account/order" class="buy-infor-headers"><i
								class="fas fa-tasks pr-5 font__size-4 buy-infor-header"></i>Quản lý đơn hàng</a></li>
					</ul>
				</div>

			</div>
			<div class="col-md-9 col-sm-12 ">
				<div class="w-100">
					<h3 class="card-title text-dark my-4">Thông tin tài khoản</h3>
				</div>
				<div class="row">
					<div class="col-md-9 bg-white">
						<form class=" pl-5" method="post" action="/account/profile">
							<div class="form-group row py-2">
								<label class="col-sm-6 col-form-label font__size-3">Họ
									tên</label>
								<div class="col-sm-10">
									<input style="font-size: 1.5rem;" type="text"
										class="form-control" id="fullName" name="fullName" value="${account.fullName }">
								</div>
							</div>
							<div class="form-group row py-2">
								<label class="col-sm-6 col-form-label font__size-3">Số
									điện thoại</label>
								<div class="col-sm-10">
									<input style="font-size: 1.5rem;" type="text"
										class="form-control" id="phone" name="phone" value="${account.phone }">
								</div>
							</div>
							<div class="form-group row py-2">
								<label class="col-sm-6 col-form-label font__size-3 ">Email</label>
								<div class="col-sm-10">
									<input style="font-size: 1.5rem;" type="text"
										class="form-control" id="email" name="email" value="${account.email}">
								</div>
							</div>
							<div class="form-group row py-2">
								<label class="col-sm-6 col-form-label font__size-3 ">Địa
									chỉ</label>
								<div class="col-sm-10">
									<input style="font-size: 1.5rem;" type="text"
										class="form-control" id="address" name="address" value="${account.address}">
								</div>
							</div>
							
							<div class="form-group row py-2 position-relative">
								<div class="col-sm-10">
									<button class="btn btn-warning" type="submit">Cập nhật</button>
								</div>
							</div>
							<!-- <div class="col-12 bg-white d-flex align-items-center justify-content-center">
                                         <form action="">
                                            <h4 class="mb-5 text-center">Hình ảnh đại diện</h4>
                                            <img src="/img/avatar.jpg" class="img-fluid" style="height: 90px;width: 100%;border-radius: 50%;" alt="">
                                        </form> 
                                    </div> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  -->