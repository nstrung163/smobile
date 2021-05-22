var url = window.location.pathname + '/api';
console.log('Url: ' + url);
var unitPrice = 0;
var productOptionId = 0;
var productId = 0;
var rateNumber = 0;
$(document).ready(function() {
	findProductDetailById();
	initCheckColor();
})

/** Change color event by checked */
$('.list-product-color').on('change', '.check', function() {
	console.log(`Giá trị của productOptionId mặc định trong sự kiện click là: ${productOptionId}`)
	initCheckColor();
	$(this).prop("checked", true);
	productOptionId = $(this).val();
	console.log(`Giá trị của productOptionId mới là: ${productOptionId}`)
})

/** Submit add product to cart */
$('.btn-check-out').on('click', function(event) {
	event.preventDefault();
	// Check user choose the color yet
	if(!productOptionId) {
		productOptionId = $('.list-product-color').find('input:eq(0)').val();
		showNotification(false, `Vui lòng chọn màu cho sản phẩm`);
	} else {
		$.ajax({
			url: '/user/add-product/' + productOptionId,
			type: 'POST',
			success: function(responseData) {
				if(responseData.responseCode == 100) {
					window.location = '/user/cart';
				} else {
					showNotification(false, `Thêm sản phẩm vào giỏ hàng thất bại!`);
				}
			},
			error: function(e) {
				showNotification(false, "Thêm sản phẩm vào giỏ hàng thất bại!" + JSON.stringify(e));
			}
		});
	}
});

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
			productOptionId = $('.list-product-color input:eq(0)').val();
			console.log(`Giá trị của productOptionId khi chuyển sang memory mới: ${productOptionId}`)
			renderPriceTitle(responsepPoductOption[0].salePrice, unitPrice);
		},
		error: function(e) {
			alert(`Hiển thị danh sách theo bộ nhớ và mã của sản phẩm không thành công! ${JSON.stringify(e)}`);
		}
	})
	
}))

/** Remove checked of siblings tag li */
$('.list-product-color').on('change', '.item-product-color input', (function() {
	$(this).parent().siblings().find('input').prop( "checked", false );
}))


/** Toggle Class form rate */
$('.box-qa__rate__show-form').on('click', function() {
	$('.box-qa__comment').toggleClass('d-none');
	if($('.box-qa__comment').hasClass('d-none')) {
		$('.btn-send-rate').text('Gửi đánh giá của bạn');
	} else {
		$('.btn-send-rate').text('Đóng');
	}
	
})

/** View all rate and comment product */
$('.box-reviewer__list').on('click', '.btn-view-all', function(event){
	event.preventDefault();
	var urlGetAllRateComment = $(this).attr("href");
	$.ajax({
		url: urlGetAllRateComment,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderBoxReviewerList(responseData.data.productCommentModels);
				$('.btn-view-all').addClass('d-none');
			} else {
				showNotification(false, responseData.responseMsg);
			}
		},
		error: function(e) {
			alert(`Xem danh sách tất cả bình luận không thàng công do: ${JSON.stringify(e)}`)
		} 		
	})
})

/** Submit rate and comment product */
$('.btnSubmitRateComment').on('click', function(event) {
	event.preventDefault();
	$("#rateNumber").val(rateNumber)
	$("#dateOfComment").val(today)
	var formRateComment = new FormData($('#from-rate-comment')[0]);
	$("#from-rate-comment").validate({
		rules: {
			rateNumber: {
				required: true,
			}
		},
		messages: {
			quantity: {
				required: "Vui lòng chọn đánh giá",
			}
		},
		errorElement: "div",
		errorClass: "error-message-invalid"
	});	
	if($("#from-rate-comment").valid()) {
		$.ajax({
			url: '/user/comment',
			type: 'POST',
			dataType: 'JSON',
			processData: false,
			contentType: false,
			enctype: 'multipart/form-data',
			data: formRateComment, 
			success: function(responseData) {
				if(responseData.responseCode == 100) {
					// Refresh page
					window.location = window.location.pathname;
				} else {
					showNotification(false, responseData.responseMsg);
				}
			}
		})
	}
	
})

/** Set value for rate number on event click */
$('.rating label').on('click', function ()
{
    var labelSelected = $(this).attr("for");
    $('.rating').find('input[name=rating]').each(function ()
    {
        if ($(this).attr("id") == labelSelected)
        {
			rateNumber = $(this).val();
            return false;
        }
    })
})

/** Remove all history clicked on product */
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

/** Initialization check color default false */
function initCheckColor() {
	$('input[type=checkbox]').each(function() {
			this.checked = false;
	})
}

function findProductRelatedByProductId(productId) {
	$.ajax({
		url: '/user/product-related/' + productId,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderProductRelated(responseData.data.productItemModels);
				console.log(responseData.responseMsg);
			} else {
				console.log(responseData.responseMsg);
			}
		},
		error: function(e) {
			alert(`Lấy danh sách sản phẩm liên quan không thành công do ${ JSON.stringify(e) }`)
		}
	})
}

/** Find product detail by product id */
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
				unitPrice = responseProduct.unitPrice;
				var responseProductInfoEntity = responseData.data.productDetailModel.productInfoEntity;
				renderBreadcrumbs(responseBrand.brandId, responseBrand.brandName);
				
				if(responseProductDetail.length != 0) {
					renderTopView(responseProduct.productName, responseProductDetail.averagePointRate, responseProductDetail.totalRate);
					renderCarouselProduct(responseProductDetail.imagesUrl);
					renderPriceTitle(responseProductDetail.productOption.salePrice, responseProduct.unitPrice);
				}
				renderProductMemory(responseData.data.productDetailModel.productMemoryPriceModels);
				renderProductColor(responseData.data.productOptionListByPriceAndId);
				$('.list-product-color input:eq(0)').prop("checked", true);
				productOptionId = $('.list-product-color input:eq(0)').val();
				/** Assgin value for product id */
				productId = responseProduct.productId;
				console.log(`Giá trị của thẻ input đầu tiên: ${$('.list-product-color input:eq(0)').val()}`)
				console.log(`Giá trị của productOptionId mặc định: ${productOptionId}`)
				if(responseProductInfoEntity != null) {
					renderProductInfoTitleAndContent(responseProduct.productName, responseProductInfoEntity.introduction);
					renderSpecificationProduct(responseProductInfoEntity);
					renderRateProductTitle(responseProduct.productName, responseProductDetail.averagePointRate);
					renderBoxReviewerList(responseData.data.productCommentModels);
					renderTotalRate(responseData.data.listTotalRate, responseProduct.productId);
				}
				addProductViewed(responseProduct.productId);
				findProductRelatedByProductId(productId);
			}
		},
		error: function(e) {
			alert(`Lấy dữ liệu chi tiết sản phẩm không thành công! ${e}`);
		}
	})
}

function addProductViewed(productId) {
	$.ajax({
		url: '/user/products-viewed/' + productId,
		type: 'POST',
		processData: false,
		contentType: false,
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				console.log(responseData.responseMsg)
			}
		},
		error: function(e) {
			alert(`Thêm sản phẩm vào danh mục đã xem không thành công do: ${JSON.stringify(e)}`)
		}
	})
}

/** Render breadcumbs */
function renderBreadcrumbs(brandId, brandName) {
	$(".breadcrumbs ul").empty();
	var rowHTML = `
				  <li><a href="/home">Trang chủ</a><i class="fas fa-angle-right"></i></li>
                  <li><a href="/user/product">Sản phẩm</a><i class="fas fa-angle-right"></i></li>
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
	                        <a href="/user/product-option/${productMemoryPriceModels[0].memoryProduct}/${productMemoryPriceModels[0].productId}" class="item-product-memory--link">
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
	                        <a href="/user/product-option/${value.memoryProduct}/${value.productId}" class="item-product-memory--link">
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
	/*<input type="hidden" value="${value.productEntity.productId}" name="${value.productEntity.productId}">*/
	$.each(productOptionList, function(key, value) {
		rowProductColorItem = `
							 <li class="item-product-color">
			                      <input class="check" id="${value.productOptionId}" type="checkbox" value="${value.productOptionId}" name="${value.productOptionId}">
								  
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
	$productRateTitle.empty();
	$totalRatePoint.empty();
	$productRateTitle.append(`Đánh giá &amp; nhận xét ${productName}`);
	$totalRatePoint.append(`<h3>SAO TRUNG BÌNH</h3>
			                  <p class="averaRatings">${averagePointRate.toFixed(1)}/5</p>
			                  <i class="fa fa-star icon-star" style="font-size: 40px"></i>
							`);
}

/** Render total rate for each rate */
function renderTotalRate(listTotalRate, productId) {
	var $boxRateStatictis = $('.box-qa__rate__statistics ul');
	var rateItem = "";
	var ratePoint = 5;
	$boxRateStatictis.empty();
	$.each(listTotalRate, function(key, value) {
		rateItem = `
			<li>
	          <span>${ratePoint}<i class="icon-star fa fa-star"></i></span>
	          <span>${value} lượt đánh giá</span>
	        </li>
		`;
		$boxRateStatictis.append(rateItem);
		ratePoint--;
	})
	$boxRateStatictis.append(`<input type="hidden" id="productId" name="productEntity.productId" value="${ productId }">`)
}


/** Render box reviewer */
function renderBoxReviewerList(productCommentModels) {
	$('.btn-view-all').removeClass('d-none');
	var $boxReivewerList = $('.box-reviewer__list');
	var rowReviewer = "";
	var productId = 0;
	$boxReivewerList.empty();
	$.each(productCommentModels, function(key, value) {
		productId = value.productId;
		rowReviewer = `<li class="box-reviewer__item">
						  <div class="box-reviewer__content">
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
						  </div>
				          <div class="box-reviewer__img comment-${key}">
							<div class='box-reviewer--item-img'>
								<a href="/${value.imageCommentUrl}" data-toggle='lightbox' data-max-width='1000'>
									<img class='img-fluid' src="/${value.imageCommentUrl}">
								</a>
							</div>
		                  </div>
				        </li>`;
		$boxReivewerList.append(rowReviewer);
		if(value.imageCommentUrl == null || value.imageCommentUrl == "") {
			$(`.comment-${key}`).addClass('d-none');
		}
	})
	$boxReivewerList.append(`
						<li class="box-reviewer__item">
							<a href="api/get-all-comment/${productId}" class="btn btn-view-all">
								Xem tất cả đánh giá <i class="fas fa-chevron-right"></i>
							</a>
						</li>
						`);

}

function renderProductRelated(productList) {
	var productItem = "";
	var $productRelated = $('.product-related .product-related__content .tab-product ul');
	$productRelated.empty();
	$.each(productList, function(key, value) {
		productItem = `
			<li class="product-promo--item">
              <a href="/user/product-detail/${ value.productEntity.productId }">
                <div class="img-container">
                  <span class="tra-gop">Trả góp 0%</span>
                  <img class="product-promo--item-img" src="/${ value.imageItem }" alt="${ value.productEntity.productName }"/>
                </div>
                <p class="product-name">${ value.productEntity.productName }</p>
                <strong class="product-price-new">${ currencyFormat(value.salePrice) }</strong>
                <span class="product-price-old product-related-${ value.productEntity.productId }">${ currencyFormat(value.productEntity.unitPrice) }₫ </span>
                <span class="percent-sale product-related-${ value.productEntity.productId }"">(- ${ (( 1 - (value.salePrice / value.productEntity.unitPrice) ) * 100).toFixed(0) } %)</span>
              </a>
              <div class="rating">
                <span class="rating__start">
                  <b>${ value.averageRate.toFixed(1) }</b>/5
                  <i class="fas fa-star"></i>
                </span>
                <span class="sl-rating">${ value.totalRate } đánh giá</span>
              </div>
            </li>
		`;
		$productRelated.append(productItem);
		if( value.productEntity.unitPrice - value.salePrice <= 0) {
			$(`.product-related-${ value.productEntity.productId }`).addClass('d-none');
		}
	})
}

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();
if(dd < 10) {
	dd = '0' + dd;
}
if(mm < 10) { 
	mm = '0' + mm;
}
today = yyyy + '-' + mm + '-' + dd;