var url = '/api' + window.location.pathname;
console.log('Url: ' + url);
$(document).ready(function() {
	findProductDetailById();
})

function findProductDetailById() {
	$.ajax({
		url: url,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			console.log(responseData)
			if(responseData.responseCode == 100) {
				var responseBrand = responseData.data.productDetailModel.productEntity.brandEntity;
				var responseProduct = responseData.data.productDetailModel.productEntity;
				var responseProductDetail = responseData.data.productDetailModel;
				renderBreadcrumbs(responseBrand.brandId, responseBrand.brandName);
				renderTopView(responseProduct.productName, responseProductDetail.averagePointRate, responseProductDetail.totalRate);
				renderCarouselProduct(responseProductDetail.imagesUrl);
			}
		}
	})
}

/** Render breadcumbs */
function renderBreadcrumbs(brandId, brandName) {
	$(".breadcrumbs ul").empty();
	var rowHTML = `
				  <li><a href="/home">Trang chủ</a><i class="fas fa-angle-right"></i></li>
                  <li><a href="/product">Sản phẩm</a><i class="fas fa-angle-right"></i></li>
                  <li><a href="/brand/${brandId}">${brandName}</a><i class="fas fa-angle-right"></i></li>
				`;
	$(".breadcrumbs ul").append(rowHTML);
}

/** Render top view */
function renderTopView(productName, averagePointRate, totalRate) {
	$(".top-view").empty();
	var rowHTML = `
				<h1>${productName}</h1>
	            <div class="rating">
	              <span class="rating__start">
	                <b>${averagePointRate.toFixed(1)}</b>/5
	                <i class="fas fa-star"></i>
	              </span>
	              <span class="sl-rating">${totalRate} đánh giá</span>
	            </div>
				`;
	$(".top-view").append(rowHTML);
}

/** Render carousle product */
function renderCarouselProduct(listImageProduct) {
	console.log('Mảng cũ listImageProduct:' + listImageProduct.length);
	var $carouselInner = $(".carousel-sale #myCarouselProduct .carousel-inner");
	var $carouselIndicator = $(".carousel-sale #myCarouselProduct .carousel-indicators");
	$carouselInner.empty();
	$carouselIndicator.empty();
	var rowCarouselItemActive = `
								<div class="carousel-item active">
			                      <img class="d-block w-100" src="/${listImageProduct[0]}"/>
			                    </div>
								`;
	$carouselInner.append(rowCarouselItemActive);
	
	var rowCarouselIndicatorActive = `
								<li data-target="#myCarouselProduct" data-slide-to="0" class="active">
			                      <img class="d-block w-40" src="/${listImageProduct[0]}"/>
			                    </li>
								`;
	$carouselIndicator.append(rowCarouselIndicatorActive);
	
	/** Remove first element */
	listImageProduct.shift();
	console.log('Mảng mới listImageProductNew:' + listImageProduct.length);
	/** Render carousel item */
	var rowCarouselItem = "";
	$.each(listImageProduct, function(key, value) {
		rowCarouselItem = `
							<div class="carousel-item">
		                      <img class="d-block w-100" src="/${value}" />
		                    </div>
						  `;
		$carouselInner.append(rowCarouselItem);
	})
	
	/* Render carousel indicator */
	var rowCarouselIndicator = "";
	$.each(listImageProduct, function(key, value) {
		rowCarouselIndicator = `
								<li data-target="#myCarouselProduct" data-slide-to="${key + 1}">
			                      <img class="d-block w-40" src="/${value}"/>
			                    </li>
								`;
		$carouselIndicator.append(rowCarouselIndicator);
	})
}

function renderPriceProductPriceAndMemory(salePrice, unitPrice, listProductMemory) {
	var $productPrice = $('.product-price .product-price__title');
	var $listMemory = $(' .product-price .list-product-memory');
	$productPrice.empty();
	$listMemory.empty();
	var rowProductPice = `
						<span class="sale-price">${salePrice} ₫</span>
                 		Giá niêm yết: 
                  		<span class="unit-price">${unitPrice} ₫</span>
                  		<button type="button" class="btn btn-aqua btn-tra-gop">Trả góp 0%</button>`;
	$productPrice.append(rowProductPice);
	var rowMemoryItem = "";
	$.each(listProductMemory, function(key, value) {
		rowMemoryItem = `
						<li class="item-product-memory">
	                        <a href="/product-option/128/1" class="item-product-memory--link">
	                            <span>512GB</span>
	                            <strong>38.500.000 ₫</strong>
	                        </a>
	                    </li>
						`;
	})
	
	
}