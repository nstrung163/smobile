<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/template/web/css/payment.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/product-page.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/category.css'/>">


<!-- pay-page -->
<section class="pay">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<h2 class="py-5 font-weight-bold ">1. Thông tin đơn hàng</h2>
					<table class="table pay-category p-5 " border="0">
						<!--infor of category pay  -->
						<tr class=" mt-5">
							<td rowspan="2" class="img-category-pay"><img
								src="/img/category3.jpg" alt="#" width="100px" height="80px"
								class="img img-responsive"></td>
							<td colspan="3" class="pay-categor-name ml-0">
								<h3 class="text-dark">Áo phong nam full size siêu ngầu siêu
									chất cho Khánh Ngáo XYZ123</h3>
							</td>
						</tr>
						<tr class="pay-category-infor">
							<td>Size: L</td>
							<td>Số lượng: 1</td>
							<td class="price">Giá: 700 000 Đ</td>
						</tr>
						<!-- end of infor category pay  -->
					</table>

					<table class="table pay-category p-5" border="0">
						<!--infor of category pay  -->
						<tr class=" mt-5">
							<td rowspan="2" class="img-category-pay"><img
								src="/img/category3.jpg" alt="#" width="100px" height="80px"
								class="img img-responsive"></td>
							<td colspan="3" class="pay-categor-name ml-0">
								<h3 class="text-dark">Áo phong nam full size siêu ngầu siêu
									chất cho Khánh Ngáo XYZ123</h3>
							</td>
						</tr>
						<tr class="pay-category-infor">
							<td>Size: L</td>
							<td>Số lượng: 1</td>
							<td class="price">Giá: 700 000 Đ</td>
						</tr>
						<!-- end of infor category pay  -->
					</table>
				</div>
				<div class="row py-4">
					<div class="w-100">
						<h2 class="  font-weight-bold ">2. Hình thức thanh toán</h2>
					</div>
					<div class="form-check payments py-4">
						<input class=" pt-3" type="radio" name="exampleRadios"
							id="exampleRadios1" value="option1" checked> <label
							class="form-check-label px-3" for="exampleRadios1"> Thanh
							toán khi nhận hàng </label>
					</div>
				</div>

			</div>
			<div class="col-lg-4 payments pl-5 pt-5">
				<div class="row">
					<div class="d-flex py-4">
						<p class="pr-5">Địa chỉ giao hàng</p>
						<a href="#" class="btn btn-light  border-1 ">Sửa</a>
					</div>
					<div class="pay-user">
						<h3 class="name-user text-uppercase font-weight-bold">Hồ xuân
							lâm</h3>
						<p class="phone-user">0858996369</p>
						<p class="adres-user">14a/195 NGUYỄN TRẢI, Phường Tây Lộc,
							Thành phố Huế, Thừa Thiên Huế</p>
					</div>
					<div class="pay-total ">
						<p class="font-weight-bold">Đơn hàng</p>
						<table class="table w-100" border="0">
							<tr>
								<td>Tạm tính:</td>
								<td>1.999.000đ</td>
							</tr>
							<tr>
								<td>Phí vận chuyển:</td>
								<td>49.000đ</td>
							</tr>
							<tr>
								<td>Tổng tiền:</td>
								<td class="text-danger">2.199.000đ</td>
							</tr>
							<tr>
								<td colspan="2"><i>(đã bao gồm phí VAT nếu có)</i></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<a href="#"
				class="btn  margin__btn-add-cart mx-auto mb-5 p-4 text-uppercase font-weight-bold">Hoàn
				thành đặt mua</a>
		</div>
	</div>
</section>
<!-- end of pay-page -->
