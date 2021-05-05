$(document).ready(function() {
	findAllProductWithApi(1);
	
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr('data-index');
		console.log(pageNumber)
		findAllProductWithApi(pageNumber);
	})
	/* Border for tag "li" on click*/
	$('.check').change(function() {
		$(this).parent().toggleClass("li-enable");
	})

	/* Show more and hidden logo brand */
	var max = 9;
	$('ul, li').each(function() {
		$(this).find('li').each(function(index) {
			if (index >= max) {
				$(this).hide();
			}
		})
	})
	$('.hidden-item').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').addClass("d-none");
		$('.show-more').removeClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				if (index >= max) {
					$(this).hide(1000);
				}
			})
		})
	})
	$('.show-more').on('click', function(event) {
		event.preventDefault();
		$('.hidden-item').removeClass("d-none");
		$('.show-more').addClass("d-none");
		$('ul, li').each(function() {
			$(this).find('li').each(function(index) {
				$(this).show(1000);
			})
		})
	})

});

/*Get list brandId*/
var listBrandArr = [];
$(".check").on('click', function() {
	listBrandArr = [];
	$('.listBrand').find('input[name="brand.logo"]:checked').each(function() {
		listBrandArr.push($(this).val());
	});
	console.log(`Value of array: ${listBrandArr.length}`)
})

function findAllProductWithApi(pageNumber) {
	$.ajax({
		url: '/user/api/product-items/' + pageNumber,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			renderProductApi(responseData.data.productItemList);
			renderPagination(responseData.data.paginationList);
		}
	})
}

function renderProductApi(productItemList) {
	var rowHTML = "";
	$(".tab-content .tab-product  ul").empty();
	$.each(productItemList, function(key, value) {
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
		$(".tab-content .tab-product  ul").append(rowHTML);
		if(value.productEntity.unitPrice - value.salePrice <= 0) {
			$(`.product-${value.productEntity.productId}`).addClass("d-none");
		}
	})
}

function renderPagination(paginationList) {
	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.firstPage + '" > Fisrt  </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > Previous </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > Next </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.lastPage + '" > Last </a></li>'
		$("ul.pagination").append(paginationInnerHtml);
	}
}

