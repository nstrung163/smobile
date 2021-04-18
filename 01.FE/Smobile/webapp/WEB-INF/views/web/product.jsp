<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="<c:url value ='/template/web/css/product-page.css'/>">
<link rel="stylesheet"
	href="<c:url value='/template/web/jquery/PagingStyle.css'/>" />


<!-- category-information -->
<section class="category-infor">
	<div class="container">
		<div class="row">
			<div class="link-menu pt-3">
				<ul class="link-menu-list  flex-column mt-3">
					<li class="nav-item link-menu-name"><a href="#"
						class=" link-page-name">TRANG CHỦ <span> / </span></a></li>
					<li class="nav-item link-menu-name"><a href="#"
						class=" link-page-name"> ÁO QUẦN NAM</a></li>
				</ul>
			</div>
			<br>
		</div>
		<div class="row pb-4 mt-4 mb-4">
			<div class="col-md-6" style="display: flex; justify-content: center;">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<c:set var="listImageSize" scope="session"
						value="${product.getListProductImage().size()-1}" />
					<c:set var="listImage" scope="session"
						value="${product.getListProductImage()}" />

					<c:set var="listProductDetail" scope="session"
						value="${product.getListProductDetail()}" />
						



					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="<c:url value='/uploads/images/${listImage.get(0).getImageUrl()}'/>"
								alt="#" width="100%" class="img img-responsive ">
						</div>
						<c:forEach var="i" begin="1" end="${listImageSize}">
							<div class="carousel-item">
								<img
									src="<c:url value='/uploads/images/${listImage.get(i).getImageUrl()}'/>"
									alt="#" width="100%" class="img img-responsive">
							</div>
						</c:forEach>
					</div>

					<div class="carousel-indicators">
						<img
							src="<c:url value='/uploads/images/${listImage.get(0).getImageUrl()}'/>"
							alt="#" data-target="#myCarousel" data-slide-to="0"
							class="active img img-responsive" />
						<c:forEach var="i" begin="1" end="${listImageSize}">
							<img
								src="<c:url value='/uploads/images/${listImage.get(i).getImageUrl()}'/>"
								alt="#" data-target="#myCarousel" data-slide-to="${i}"
								class="img img-responsive" />
						</c:forEach>
					</div>

					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#myCarousel"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#myCarousel"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="category-information">
					<div class="row">
						<p class="font-weight-normal" style="font-size: 20px;">${product.getProductName()}</p>						
						<br>												
					</div>
					<div class="row">
						<p class="font-weight-bold float-left">
							<span style="font-size: 32px;">${product.getLongSalePrice()}đ</span>
							<span style="font-size: 12px; text-decoration: line-through;">${product.getLongPrice()}đ</span>
						</p>
					</div>
					<div class="row">
						<p class="font-weight-light float-left">
							Thương hiệu: <a
								href="/search/brand/${product.getBrand().getBrandName()}">${product.getBrand().getBrandName()}</a>
						</p>
					</div>
					<div class="row">
						<form action="/checkout/cart/add/${product.productId}"
							method="POST" class="w-100">
	
							<div class="  pt-3 pl-3 form-group ">
								<div class="row">
									<p class="font-weight-normal">Chọn size:</p>
								</div>
								<div class="row">
									<select name="size" id="size"
									class=" btn btn-light product-name float-left category-size">
										<c:choose>
											<c:when
												test="${listProductDetail != null && listProductDetail.size() != 0}">
												<c:forEach var="detail" items="${listProductDetail}">
													<option value="${detail.size}">${detail.size}</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value="default">Mặc định</option>
											</c:otherwise>
										</c:choose>
		
									</select>
								</div>
							</div>
	
							<div class=" btn-add-card pl-3 pt-4 row">
								<div class="col-12">
									<p class="font-weight-normal d-plex">Số lượng:</p>
								</div>
								<div class="btn-group " style="margin-right: 15%">
									<button type="button" class="fas fa-minus" data-type="minus"
										data-field="" onclick="sub()"></button>
									<input type="number" id="quantity" name="quantity"
										class="form-control input-number" value="1" min="1" max="100">
									<button type="button" class="fas fa-plus" data-type="plus"
										data-field="" onclick="add()"></button>
								</div>								
							</div>
							<button class="btn btn-add mt-5 w-75  submit">Thêm vào Giỏ</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- đề xuất sản phẩm -->
	<div class="container pt-4 mb-4 mt-4">
			
		<div id="carousel-product-same" class="carousel slide  " data-ride="carousel">
				
				<div class="row ">
					<div class="col-md-11">
						<h2>Sản phẩm có thể bạn sẽ thích</h2>
					</div>
					<div class="col-md-1 ">
						<!-- Controls-->
						<div class=" text-center d-flex">
							<a class=" left float-left fa fa-chevron-left  "
								href="#carousel-product-same" data-slide="prev"></a>
							<a class=" right float-right fa fa-chevron-right ml-5 "
								href="#carousel-product-same" data-slide="next">
							</a>
						</div>
					</div>
				</div>
				
				<!-- Wrapper for slides -->
				<%-- <div class="carousel-inner pt-3">
					
					<!-- set slide number -->
					<c:set var="listProductSameSize" scope="session"
						value="${listProductsOffer.size()}" />
			        <c:if test = "${ listProductSameSize  >= 4 }">
			         	<c:set var = "templistProductSameSize" scope = "session" value = "${3}"/>
			        </c:if>
			        <c:if test = "${ listProductSameSize  < 4 }">
			         	<c:set var = "templistProductSameSize" scope = "session" value = "${ listProductSameSize }"/>
			        </c:if>
			        
			        <p>size of listProductSameSize: <c:out value="${ listProductSameSize }" /></p>
			        <p>size of templistProductSameSize: <c:out value="${ templistProductSameSize }" /></p> 
					
					<div class="carousel-item active">
						<div class="row">
							<c:forEach var="i" begin="0" end="${ templistProductSameSize }" >
								<div class="col-6 col-lg-3 col-md-4  ">
								
	                                <div class="category-box">
	
	                                    <img src="<c:url value='/uploads/images/${listProductsOffer.get(i).getListProductImage().get(0).getImageUrl()}'/>" alt="#" width="25%" class=" w-100 h-75 img img-responsive">
 	 
	                                    <p class="category-name">${listProductsOffer.get(i).getProductName() }</p>
	                                    <!-- <p class="category-price">777.777 <span class="vnd">₫</span></p> -->
	                                    <div class="card-text text-left font-weight-bold d-flex justify-content-center">
	                                        <span class="product__price product__price-old">${listProductsOffer.get(i).getLongSalePrice() }</span>
	                                        <span class="product__price product__price-new">${listProductsOffer.get(i).getLongPrice() }</span>
	                                    </div>
	                                    <a href="<c:url value='/product/${listProductsOffer.get(i).getProductId()}'/>" class="btn  margin__btn-add-cart m-auto">Xem Sản Phẩm</a>
	                                </div>
	                            </div>
							</c:forEach>	
						</div>
					</div>	
					
					<c:if test = "${ listProductSameSize  < 8 }">
			         	<c:set var = "templistProductSameSize1" scope = "session" value = "${ listProductSameSize }"/>
			        </c:if>	
			        <c:if test = "${ listProductSameSize  >= 8 }">
			         	<c:set var = "templistProductSameSize1" scope = "session" value = "8"/>
			        </c:if>	
			        
			        <c:if test = "${ listProductSameSize  >= 4 }">
			         	<div class="carousel-item ">
							<div class="row">
								<c:forEach var="i" begin="4" end="${ templistProductSameSize1 -1 }" >
									<div class="col-6 col-lg-3 col-md-4  ">
									
		                                <div class="category-box">
		
		                                    <img src="<c:url value='/uploads/images/${listProductsOffer.get(i).getListProductImage().get(0).getImageUrl()}'/>" alt="#" width="25%" class=" w-100 h-75 img img-responsive">
	 	 
		                                    <p class="category-name">${listProductsOffer.get(i).getProductName() }</p>
		                                    <!-- <p class="category-price">777.777 <span class="vnd">₫</span></p> -->
		                                    <div class="card-text text-left font-weight-bold d-flex justify-content-center">
		                                        <span class="product__price product__price-old">${listProductsOffer.get(i).getLongSalePrice() }</span>
		                                        <span class="product__price product__price-new">${listProductsOffer.get(i).getLongPrice() }</span>
		                                    </div>
		                                    <a href="<c:url value='/product/${listProductsOffer.get(i).getProductId()}'/>" class="btn  margin__btn-add-cart m-auto">Xem Sản Phẩm</a>
		                                </div>
		                            </div>
								</c:forEach>	
							</div>	
						</div>
			        </c:if>	
			        
			         <c:if test = "${ listProductSameSize  >= 8 }">
			         	<div class="carousel-item ">
							<div class="row">
								<c:forEach var="i" begin="${ templistProductSameSize1 }" end="${ listProductSameSize -1}" >
									<div class="col-6 col-lg-3 col-md-4  ">
									
		                                <div class="category-box">
		
		                                    <img src="<c:url value='/uploads/images/${listProductsOffer.get(i).getListProductImage().get(0).getImageUrl()}'/>" alt="#" width="25%" class=" w-100 h-75 img img-responsive">
	 	 
		                                    <p class="category-name">${listProductsOffer.get(i).getProductName() }</p>
		                                    <!-- <p class="category-price">777.777 <span class="vnd">₫</span></p> -->
		                                    <div class="card-text text-left font-weight-bold d-flex justify-content-center">
		                                        <span class="product__price product__price-old">${listProductsOffer.get(i).getLongSalePrice() }</span>
		                                        <span class="product__price product__price-new">${listProductsOffer.get(i).getLongPrice() }</span>
		                                    </div>
		                                    <a href="<c:url value='/product/${listProductsOffer.get(i).getProductId()}'/>" class="btn  margin__btn-add-cart m-auto">Xem Sản Phẩm</a>
		                                </div>
		                            </div>
								</c:forEach>	
							</div>	
						</div>
			        </c:if>				
						
				</div> --%>
			</div>
		</div>

	<div class="container pb-4 mt-4 mb-4">
		<h3 class="font-weight-bold py-3">Thông Tin Chi Tiết</h3>
		<div>${product.getDescription()}</div>
	</div>


	<div class="container pb-4 mt-4 mb-4">
		<h3 class="font-weight-bold py-3">Bình Luận</h3>

		<form action="/comment/${product.productId}" method="post">
			<div class="form-group">
				<label for="commentTitle" class="form-label font-weight-normal">Tiêu
					đề</label> <input type="text" class="form-control" id="title" name="title"
					placeholder="Nhập tiêu đề">
			</div>
			<div class="form-group">
				<label for="commentContent" class="form-label font-weight-normal">Nội
					dung</label>
				<textarea class="form-control" id="content" rows="5" name="content"
					placeholder="Nhập nội dung"></textarea>
			</div>
			<button type="submit" class="btn btn-dark text-light">Bình
				luận</button>
		</form>


		<div style="display: block; width: 100%">
			<ul id="listComment" style="display: block; width: 100%">
				<c:forEach items="${product.getListCommentReverse()}" var="comment">
					<li class="row comment">
						<div class="col-md-3">
							<div >
								<img src="/uploads/images/${comment.getAccount().getAvatar()}" alt="#"
									class="img img-resonsive mt-4 ">
							</div>
							<div>
								<h4 class="font-weight-normal mt-3">${comment.getAccount().getFullName()}</h4>
							</div>
						</div>

						<div class="col-md-9">
							<p class="font-weight-bold mt-3">${comment.title }</p>
							<p class="">${comment.getContent()}</p>
							<p class="" style="font-size: 12px">Nhận xét vào:
								${comment.getDateCreatedString()}</p>
						</div>

					</li>
				</c:forEach>

			</ul>
		</div>
	</div>


	<div class="container pt-4 mb-4 mt-4">
		<div class="row">
			<div class="row">
					<h2 class=" mb-4 pl-4">Sản Phẩm Liên Quan</h2>
			</div>
			
			<%-- <c:set var="listProductsByCategorySize" scope="session"
						value="${listProductsByCategory.size()}" />			
			<div class="row">
				 <c:if test = "${ listProductsByCategorySize  > 0 }">
			      	<c:forEach var="i" begin="0" end="${ listProductsByCategorySize -1}" >
						<div class="col-6 col-lg-3 col-md-4  ">
                              <div class="category-box">
                                  <img src="<c:url value='/uploads/images/${listProductsByCategory.get(i).getListProductImage().get(0).getImageUrl()}'/>" alt="#" width="25%" class=" w-100 h-75 img img-responsive">
                                  <p class="category-name">${listProductsByCategory.get(i).getProductName() }</p>
                                  <!-- <p class="category-price">777.777 <span class="vnd">₫</span></p> -->
                                  <div class="card-text text-left font-weight-bold d-flex justify-content-center">
                                      <span class="product__price product__price-old">${listProductsByCategory.get(i).getLongSalePrice() }</span>
                                      <span class="product__price product__price-new">${listProductsByCategory.get(i).getLongPrice() }</span>
                                  </div>
                                  <a href="<c:url value='/product/${listProductsByCategory.get(i).getProductId()}'/>" class="btn  margin__btn-add-cart m-auto">Xem Sản Phẩm</a>
                              </div>
                          </div>
					</c:forEach>
			     </c:if>
				
			</div> --%>
			
		</div>
	</div>
</section>
<script type="text/javascript">
	function add() {
		var quantity = parseInt(document.getElementById("quantity").value);
		quantity = quantity + 1;
		document.getElementById("quantity").value = quantity;
	}

	function sub() {
		var quantity = parseInt(document.getElementById("quantity").value);
		quantity = quantity - 1;
		if (quantity < 1)
			quantity = 1;
		document.getElementById("quantity").value = quantity;
	}
</script>


<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/jquery/comment-paging.js'/>"></script>

<script type="text/javascript">
	$("#listComment").JPaging();
</script>


