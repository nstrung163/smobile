$(document).ready(function() {
	searchByKeyword(1, false);
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr('data-index');
		var keyword = $('.search__input').val();
		if(keyword != "") {
			searchByKeyword(pageNumber, true);
		}
	})
	
})

$('#search-keyword').click(function(event) {
	event.preventDefault();
	searchByKeyword(1, false);
})

function renderTitleSearchBox(totalResult, keyword) {
	var $titleSearch = $('.search-box');
	$titleSearch.empty();
	$titleSearch.append(`<h2 class="search-box__title">Tìm thấy <span>${totalResult}</span> kết quả với từ khóa <span>"${keyword}"</span></h2>`)
}

/** 
*
*	Search product with condition 
*
*	@param pageNumber,
*	@returns List<ProducList>
*/
function searchByKeyword(pageNumber, isClickedPagination) {
	var urlSearch = window.location.pathname;
	$.ajax({
		url: urlSearch + '/' + pageNumber,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			$('.search__input').val(responseData.data.keyword);
			if(!isClickedPagination) {
				renderTitleSearchBox(responseData.data.totalResult, responseData.data.keyword)
			}
			if(responseData.data.productList.length == 0) {
				$('.not-found-product').removeClass('d-none')
				$('.outstanding-phone').addClass('d-none')
				renderNotFoudProduct(responseData.data.keyword);
			} else {
				$('.outstanding-phone').removeClass('d-none');
				$('.not-found-product').addClass('d-none')
				renderProductApi(responseData.data.productList);
				renderPagination(responseData.data.paginationList);
				if(responseData.data.paginationList.pageNumberList.length < 2) {
					$('.pagination').addClass("d-none");
				} else {
					$('.pagination').removeClass("d-none");
				}
			}
		}
	})
}

/**
*
* Render product 
*
* @param productList
*/
function renderProductApi(productList) {
	var rowHTML = "";
	var $outstandingPhone = $(".outstanding-phone .tab-content .tab-product  ul");
	$outstandingPhone.empty();
	$.each(productList, function(key, value) {
		rowHTML = `
				<li class="product-promo--item">
	                <a href="/user/product-detail/${value.productEntity.productId}">
	                  <div class="img-container">
	                    <span class="tra-gop">Trả góp 0%</span>
	                    <img class="product-promo--item-img" src="/${value.imageItem}" alt="${value.productEntity.productName}"/>
	                  </div>
	                  <div class="price-discount product-${value.productEntity.productId}">
	                    <span>Giảm ${currencyFormat(value.productEntity.unitPrice - value.salePrice)} ₫</span>
	                  </div>
	                  <p class="product-name">${value.productEntity.productName}</p>
	                  <strong class="product-price-new">${currencyFormat(value.salePrice)}₫</strong>
	                  <span class="product-price-old product-${value.productEntity.productId}"> ${currencyFormat(value.productEntity.unitPrice)}₫</span>
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

function renderNotFoudProduct(keyword) {
	var $notFoundArea = $('.not-found-product');
	$notFoundArea.empty();
	$notFoundArea.append(`
					  <img class="not-found__img" src="/images/noti-search.png" alt="Không tìm thấy sản phẩm" >
			          <p class="not-found__nofication">Rất tiếc chúng tôi không tìm thấy kết quả của <span class="span-bold">${keyword}</span></p>
			          <div class="not-found__recommend-search">
			              <h4 class="not-found__recommend__title">Để tìm được kết quả chính xác hơn, xin vui lòng:</h4>
			              <ul class="not-found__recommend__list">
			                  <li class="not-found--item">Kiểm tra lỗi chính tả của từ khóa đã nhập</li>
			                  <li class="not-found--item">Thử lại bằng từ khóa khác</li>
			                  <li class="not-found--item">Thử lại bằng những từ khóa tổng quát hơn</li>
			                  <li class="not-found--item">Thử lại bằng những từ khóa ngắn gọn hơn</li>
			              </ul>
			          </div>
						`);
}

/** Render pagination 
	@param paginationList  
*/
function renderPagination(paginationList) {
	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.firstPage + '" > Trang Đầu  </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > &larr; Lùi </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > Tiếp &rarr; </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.lastPage + '" > Trang Cuối </a></li>'
		$("ul.pagination").append(paginationInnerHtml);
	}
}
