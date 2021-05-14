$(document).ready(function() {
	findAllProductOutstanding();
	findListOutstandingTitle();
	findTenProductDiscountHighest();
})

$('.product-viewed--link-remove').on('click', function(event) {
	event.preventDefault();
	$.ajax({
		url: '/user/products-viewed/remove',
		type: 'DELETE',
		success: function(responseData){
			if(responseData.responseCode == 100) {
				console.log('Xóa danh mục mua hàng thành công!');
				$('.product-viewed-area').empty();
			} else {
				console.log('Xóa danh mục mua hàng không thành công!');
			}
		},
		error: function(e) {
			console.log(`Xóa danh mục mua hàng không thành công do: ${JSON.stringify(e)}`);
		}
	})
})

function findAllProductOutstanding() {
	$.ajax({
		url: '/user/product-items',
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderProductOutstanding(responseData.data.productItemList);
			}
		},
		error: function(e) {
			alert(`Lấy danh sách sản phẩm nổi bại thất bại! ${JSON.stringify(e)}`);
		}
	})
}

function findListOutstandingTitle() {
	$.ajax({
		url: '/user/product-outstanding',
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderListOutstanding(responseData.data.listProductOutstanding, responseData.data.totalProduct);
			}
		},
		error: function(e) {
			alert(`Lỗi khi lấy danh sách sản phẩm nội bật ở tiêu đề! ${JSON.stringify(e)}`);
		}
	})
}

function findTenProductDiscountHighest(){
	$.ajax({
		url: '/user/product-items-highest',
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderProductPromotion(responseData.data.productItemList);
			}
		},
		error: function(e) {
			alert(`Lỗi khi lấy danh sách giảm giá cao nhất ${JSON.stringify(e)}`);
		}
	})
}

function renderProductPromotion(productItemList) {
	var productItemHTML = "";
	var $productPromotionActive = $('#product-promotions .carousel-inner .carousel-item-fisrt ul');
	var $productPromotion = $('#product-promotions .carousel-inner .carousel-item-second ul');
	$productPromotionActive.empty();
	$productPromotion.empty();
	$.each(productItemList, function(key, value) {
		if(key < 5) {
			productItemHTML = 
				` <li class="product-promo--item">
                    <a href="/user/product-detail/${ value.productEntity.productId }">
                      <div class="img-container">
                        <span class="tra-gop">Trả góp 0%</span>
                        <img src="${ value.imageItem }" alt="" data-holder-rendered="true"/>
                      </div>
                      <div class="price-discount">
                          <span>Giảm ${ currencyFormat(value.productEntity.unitPrice - value.salePrice) } ₫</span>
                      </div>
                      <p class="product-name">
                        ${ value.productEntity.productName }
                      </p>
                      <strong class="product-price-new">${ currencyFormat(value.salePrice) } ₫</strong>
                      <span class="product-price-old"> ${ currencyFormat(value.productEntity.unitPrice) } ₫</span>
                      <span class="percent-sale">(-${((1-(value.salePrice/value.productEntity.unitPrice))*100).toFixed(0) }%)</span>
                    </a>
                    <div class="rating">
                      <span class="rating__start">
                        <b>${ value.averageRate.toFixed(1) }</b>/5
                        <i class="fas fa-star"></i>
                      </span>
                      <span class="sl-rating">${ value.totalRate } đánh giá</span>
                    </div>
                </li>`;
			$productPromotionActive.append(productItemHTML);
		}
		/*$productPromotionActive.parent().addClass('active');*/
	})
	
	$.each(productItemList, function(key, value) {
		if(key >= 5) {
			productItemHTML = 
			` <li class="product-promo--item">
                    <a href="/user/product-detail/${ value.productEntity.productId }">
                      <div class="img-container">
                        <span class="tra-gop">Trả góp 0%</span>
                        <img src="${ value.imageItem }" alt="" data-holder-rendered="true"/>
                      </div>
                      <div class="price-discount">
                          <span>Giảm ${ currencyFormat(value.productEntity.unitPrice - value.salePrice) } ₫</span>
                      </div>
                      <p class="product-name">
                        ${ value.productEntity.productName }
                      </p>
                      <strong class="product-price-new">${ currencyFormat(value.salePrice) } ₫</strong>
                      <span class="product-price-old"> ${ currencyFormat(value.productEntity.unitPrice) } ₫</span>
                      <span class="percent-sale">(-${((1-(value.salePrice/value.productEntity.unitPrice))*100).toFixed(0) }%)</span>
                    </a>
                    <div class="rating">
                      <span class="rating__start">
                        <b>${ value.averageRate.toFixed(1) }</b>/5
                        <i class="fas fa-star"></i>
                      </span>
                      <span class="sl-rating">${ value.totalRate } đánh giá</span>
                    </div>
                </li>`;
			$productPromotion.append(productItemHTML);
		}
	})
}


function renderProductOutstanding(productList) {
	var rowHTML = "";
	var $outstandingPhone = $(".outstanding-phone .tab-content .tab-product  ul");
	$outstandingPhone.empty();
	$.each(productList, function(key, value) {
		rowHTML = `
				<li class="product-promo--item">
	                <a href="user/product-detail/${value.productEntity.productId}">
	                  <div class="img-container">
	                    <span class="tra-gop">Trả góp 0%</span>
	                    <img src="${value.imageItem}" alt="${value.productEntity.productName}"/>
	                  </div>
	                  <p class="product-name">${value.productEntity.productName}</p>
	                  <strong class="product-price-new">${currencyFormat(value.salePrice)} ₫</strong>
	                  <span class="product-price-old product-${value.productEntity.productId}">${currencyFormat(value.productEntity.unitPrice)} ₫</span>
	                  <span class="percent-sale product-${value.productEntity.productId}">(-${((1-(value.salePrice/value.productEntity.unitPrice))*100).toFixed(0)})%</span>
	                </a>
	                <div class="rating">
	                  <span class="rating__start">
	                    <b>${value.averageRate.toFixed(1)}</b>/5
	                    <i class="fas fa-star"></i>
	                  </span>
	                  <span class="sl-rating">${value.totalRate} đánh giá</span>
	                </div>
	           </li>
		    `;
		$outstandingPhone.append(rowHTML);
		if(value.productEntity.unitPrice - value.salePrice <= 0) {
			$(`.product-${value.productEntity.productId}`).addClass("d-none");
		}
	})
}

function renderListOutstanding(listProductOutstanding, totalProduct) {
	var rowHTML ="";
	$(".most-outstanding ul").empty();
	$.each(listProductOutstanding, function(key, value) {
		rowHTML = `
				<li class="item-outstanding">
					<a href="user/product-detail/${value.productId}" class="link-outstanding">${value.productName}</a>
				</li>
				`;
		$(".most-outstanding ul").append(rowHTML);
	})
	$(".most-outstanding ul").append(`<li class="item-outstanding"><a href="/user/product" class="link-outstanding">Xem tất cả <span class="total-product">${totalProduct}</span>điện thoại</a></li>`);
}