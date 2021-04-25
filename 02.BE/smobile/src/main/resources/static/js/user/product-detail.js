var url = '/api' + window.location.pathname;
console.log('Url: ' + url);
$(document).ready(function() {
	findProductDetailById();
	initCheckColor();
})

/** Render list product color by price and memory */
$(".list-product-memory").on('click', 'li a.item-product-memory--link', (function(event) {
	event.preventDefault();
	$('.item-product-memory').removeClass('memory-active');
	var urlOption = $(this).attr("href");
	$(this).parent().addClass('memory-active');
	$.ajax({
		url: urlOption,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			var responsepPoductOption = responseData.data.productOptionList;
			renderProductColor(responsepPoductOption);
			$('.list-product-color input:eq(0)').prop("checked", true);
			renderPriceTitle(responsepPoductOption[0].salePrice, responsepPoductOption[0].salePrice*1.1);
		},
		error: function(e) {
			alert(`Hiển thị danh sách theo bộ nhớ và id của sản phẩm không thành công! ${e}`);
		}
	})
	
}))

/** Remove checked of siblings tag li */
$('.list-product-color').on('change', '.item-product-color input', (function() {
	$(this).parent().siblings().find('input').prop( "checked", false );
}))


/** */
$('.box-qa__rate__show-form').on('click', function() {
	$('.box-qa__comment').toggleClass('d-none');
	if($('.box-qa__comment').hasClass('d-none')) {
		$('.btn-send-rate').text('Gửi đánh giá của bạn');
	} else {
		$('.btn-send-rate').text('Đóng');
	}
	
})
function initCheckColor() {
	$('input[type=checkbox]').each(function() {
			this.checked = false;
	})
}
	
function findProductDetailById() {
	$.ajax({
		url: url,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				var responseProductDetail = responseData.data.productDetailModel;
				var responseBrand = responseData.data.productDetailModel.productEntity.brandEntity;
				var responseProduct = responseData.data.productDetailModel.productEntity;
				var responseProductInfoEntity = responseData.data.productDetailModel.productInfoEntity;
				renderBreadcrumbs(responseBrand.brandId, responseBrand.brandName);
				renderTopView(responseProduct.productName, responseProductDetail.averagePointRate, responseProductDetail.totalRate);
				renderCarouselProduct(responseProductDetail.imagesUrl);
				renderPriceTitle(responseProductDetail.productOption.salePrice, responseProduct.unitPrice);
				renderProductMemory(responseData.data.productDetailModel.productMemoryPriceModels);
				renderProductColor(responseData.data.productOptionListByPriceAndId);
				$('.list-product-color input:eq(0)').prop("checked", true);
				renderProductInfoTitleAndContent(responseProduct.productName, responseProductInfoEntity.introduction);
				renderSpecificationProduct(responseProductInfoEntity);
				renderRateProductTitle(responseProduct.productName, responseProductDetail.averagePointRate);
				renderBoxReviewerList(responseData.data.productCommentModels);
			}
		},
		error: function(e) {
			alert(`Lấy dữ liệu chi tiết sản phẩm không thành công! ${e}`);
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
	
	/** Remove element active */
	listImageProduct.shift();
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

function renderPriceTitle(salePrice, unitPrice) {
	var $productPrice = $('.product-price__title');
	$productPrice.empty();
	var rowProductPice = `
						<span class="sale-price">${currencyFormat(salePrice)} ₫</span>
                 		Giá niêm yết: 
                  		<span class="unit-price">${currencyFormat(unitPrice)} ₫</span>
                  		<button type="button" class="btn btn-aqua btn-tra-gop">Trả góp 0%</button>`;
	$productPrice.append(rowProductPice);
}

function renderProductMemory(productMemoryPriceModels) {
	var $listMemory = $('.product-price .list-product-memory');
	$listMemory.empty();
	var rowMemoryItemActive = `
							<li class="item-product-memory memory-active">
	                        <a href="/product-option/${productMemoryPriceModels[0].memoryProduct}/${productMemoryPriceModels[0].productId}" class="item-product-memory--link">
	                            <span>${productMemoryPriceModels[0].memoryProduct} GB</span>
	                            <strong>${currencyFormat(productMemoryPriceModels[0].salePrice)} ₫</strong>
	                        </a>
	                    </li>
							`;
	$listMemory.append(rowMemoryItemActive);
	/** Remove element memory active */
	productMemoryPriceModels.shift();
	$.each(productMemoryPriceModels, function(key, value) {
		rowMemoryItem = `
						<li class="item-product-memory">
	                        <a href="/product-option/${value.memoryProduct}/${value.productId}" class="item-product-memory--link">
	                            <span>${value.memoryProduct} GB</span>
	                            <strong>${currencyFormat(value.salePrice)} ₫</strong>
	                        </a>
	                    </li>
						`;
		$listMemory.append(rowMemoryItem);
	})
}

function renderProductColor(productOptionList) {
	var $productColor = $('.product-color ul');
	$productColor.empty();
	var rowProductColorItem = "";
	$.each(productOptionList, function(key, value) {
		rowProductColorItem = `
							 <li class="item-product-color">
			                      <input class="check" id="${value.productOptionId}" type="checkbox" value="${value.productOptionId}" name="${value.colorProductName}">
			                      <label for="${value.productOptionId}">
			                        <span>${value.colorProductName}</span>
			                        <strong>${currencyFormat(value.salePrice)} ₫</strong>
			                      </label>
			                  </li>`;
		$productColor.append(rowProductColorItem).hide().fadeIn(300);
	})
}

function renderProductInfoTitleAndContent(title, content) {
	var $productInfoTitle = $(".box-product-info__left__title");
	var $productInfoContent = $(".box-product-info__left__content");
	$productInfoTitle.empty();
	$productInfoContent.empty();
	$productInfoTitle.append(`<h2>Đặc điểm nổi bật của: ${title}</h2>`);
	$productInfoContent.append(`<p>${content}</p>`);
}

function renderSpecificationProduct(productInfo) {
	var $productSpecificationTable = $('.box-product-info___right .card-body .table-content tbody');
	$productSpecificationTable.empty();
	var rowHTML = `
			  <tr>
                <td>Màn hình</td>
                <td><span>${productInfo.screen}</span></td>
              </tr>
              <tr>
                <td>Camera sau</td>
                <td><span>${productInfo.rearCamera}</span></td>
              </tr>
              <tr>
                <td>Camera Selfie</td>
                <td><span>${productInfo.frontCamera}</span></td>
              </tr>
              <tr>
                <td>RAM&nbsp;</td>
                <td><span>${productInfo.ram} GB</span></td>
              </tr>
              <tr>
                <td>Bộ nhớ trong</td>
                <td><span>${productInfo.internalMemory} GB</span></td>
              </tr>
              <tr>
                <td>CPU</td>
                <td><span>${productInfo.cpu}</span></td>
              </tr>
              <tr>
                <td>Dung lượng pin</td>
                <td><span>${productInfo.batteryCapacity}</span></td>
              </tr>
              <tr>
                <td>Thẻ sim</td>
                <td><span>${productInfo.sim}</span></td>
              </tr>
              <tr>
                <td>Hệ điều hành</td>
                <td><span>${productInfo.operatingSystem}</span></td>
              </tr>
			 `;
	$productSpecificationTable.append(rowHTML);
}

function renderRateProductTitle(productName, averagePointRate) {
	var $productRateTitle = $('.box-qa__title');
	var $totalRatePoint = $('.box-qa__rate__point');
	var $statisticRate = $('.box-qa__rate__statistics');
	$productRateTitle.empty();
	$totalRatePoint.empty();
	$productRateTitle.append(`Đánh giá &amp; nhận xét ${productName}`);
	$totalRatePoint.append(`<h3>SAO TRUNG BÌNH</h3>
			                  <p class="averaRatings">${averagePointRate.toFixed(1)}/5</p>
			                  <i class="fa fa-star icon-star" style="font-size: 40px"></i>`);
}

function renderBoxReviewerList(productCommentModels) {
	var $boxReivewerList = $('.box-reviewer__list');
	var rowReviewer = "";
	$boxReivewerList.empty();
	$.each(productCommentModels, function(key, value) {
		rowReviewer = `<li class="box-reviewer__item">
				          <img class="img-avt w-30" src="/${value.avatarUrl}" alt="${value.avatarUrl}">
				          <div>
				            <span class="box-reviewer__item--name">${value.fullName}</span> 
				            <br>
				            <span class="box-reviewer__item--star">
							  Đánh giá: <span class="box-reviewer__item--number">${ value.rateNumber }</span> <i class="fa fa-star checked"></i>
				              <span class="box-reviewer__item--date">Ngày ${getFormattedDate(value.dateOfComment)}</span>
				            </span>
				            <p class="box-reviewer__item--content">${value.commentContent}</p>
				          </div>
				        </li>`;
		$boxReivewerList.append(rowReviewer);
		
	})
}
