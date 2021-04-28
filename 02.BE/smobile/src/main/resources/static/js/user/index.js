$(document).ready(function() {
	findAllProductOutstanding();
	findListOutstandingTitle();
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


function renderProductOutstanding(productList) {
	var rowHTML = "";
	$(".tab-content .tab-product  ul").empty();
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
	                  <span class="product-price-old">${currencyFormat(value.productEntity.unitPrice)} ₫</span>
	                  <span class="percent-sale"></span>
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
		$(".tab-content .tab-product  ul").append(rowHTML);
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
	$(".most-outstanding ul").append(`<li class="item-outstanding"><a href="/product" class="link-outstanding">Xem tất cả <span class="total-product">${totalProduct}</span>điện thoại</a></li>`);
}