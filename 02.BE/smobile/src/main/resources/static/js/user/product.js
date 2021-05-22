$(document).ready(function() {
	findAllProductWithApi(1);
	
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr('data-index');
		var keyword = $('.search__input').val();
		if(keyword != "" || listBrandArr.length != 0 || priceFrom != "" || priceTo != "") {
			searchProductCondition(pageNumber, false);
		} else {
			findAllProductWithApi(pageNumber);
		}
		
	})
	
	/* Border for tag "li" on click*/
	$('.check').change(function() {
		$(this).parent().toggleClass("li-enable");
	})
	
	/* Initial price item, remove all tag a have class check-price(actives) */
	$(".search-product--link").removeClass('check-price');
	
	/** Initial condition search box  */
	initialSeachCondtion();
	$('.btn-delete-all-box').empty();
	
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

/*Get condition search*/
var listBrandArr = [];
var priceFrom = "";
var priceTo = "";
var listTypeProduct = [];
var listRam = [];
var listPin = [];
var sortBy = "";

/** Check on brand */
$(".check").on('click', function() {
	listBrandArr = [];
	var dataNameBrand = $(this).parent().attr("data-name");
	console.log(dataNameBrand);
	if(!checkExistConditionSearch(dataNameBrand)) {
		renderConditionSearch(dataNameBrand, dataNameBrand)
	} else {
		removeConditionSearch(dataNameBrand);
	}
	$('.listBrand').find('input[name="brand.logo"]:checked').each(function() {
		listBrandArr.push($(this).val());
		
	});
})

/** Check on search price */
$('.search-product-list .search-product--item .search-product--link').on('click', function(event) {
	event.preventDefault();
	priceFrom = "";
	priceTo = "";
	var $parent = $(this).parent();
	if(!$parent.hasClass('check-price')) {
		var dataId = $(this).attr("data-id");
		$parent.siblings().removeClass('check-price');
		$parent.addClass('check-price');
		switch(dataId) {
			case "5":
				priceTo = "5000000";
				break;
			case "5-10":
				priceFrom = "5000000";
				priceTo = "10000000";
				break;
			case "10-15":
				priceFrom = "10000000";
				priceTo = "15000000";
				break;
			case "15-20":
				priceFrom = "15000000";
				priceTo = "20000000";
				break;
			case ">20":
				priceFrom = "20000000";
				break;
			default:
				priceFrom = "0";
				priceTo = "0";
		}
		var dataIdPrice = $(this).attr("data-id");
		console.log($(this).parent().hasClass('check-price'))
		if(!checkExistConditionSearch(dataIdPrice) && $(this).parent().hasClass('check-price')) {
			$('.condition-search-item--price').remove();
			var nameCondition = $(this).text();
			renderConditionSearchPrice(dataIdPrice, nameCondition)
		}
	}
	console.log(`Data-id on tag clicked: ${dataId}, price from: ${priceFrom}, price to: ${priceTo}`);
})

/** Choose filter search */
$('.list-filter--link').on('click', function (event) {
    event.preventDefault();
    if (!$(this).find('.icon-checkbox').hasClass('check-filter-box')) {
        $(this).find('.icon-checkbox').addClass('check-filter-box')
    } else {
        $(this).find('.icon-checkbox').removeClass('check-filter-box')
    }
})

/** Choose type product */
$('.list-filter__type-phone .list-filter--type-product').on('click', function(event) {
	event.preventDefault();
	var dataTypeProduct = $(this).attr("data-id");
	if(!checkExistConditionSearch(dataTypeProduct)) {
		var nameCondition = $(this).text();
		renderConditionSearch(dataTypeProduct, nameCondition)
	} else {
		removeConditionSearch(dataTypeProduct);
	}
	listTypeProduct = [];
	$('.list-filter__type-phone li').find('.check-filter-box').each(function() {
		var dataIdTypeProduct = $(this).parent().attr("data-id");
		listTypeProduct.push(dataIdTypeProduct);
	})
	console.log(`Value of list type product: ${JSON.stringify(listTypeProduct)}`);
})

/** Choose ram */
$('.list-filter__ram .list-filter--ram').on('click', function(event) {
	event.preventDefault();
	var dataIdRam = $(this).attr("data-id");
	// Kiểm tra xem trong conditon search đã có dataId hay chưa nếu chưa thì render còn không thì remove
	if(!checkExistConditionSearch(dataIdRam)) {
		var nameCondition = $(this).parent().text();
		renderConditionSearch(dataIdRam, nameCondition)
	} else {
		removeConditionSearch(dataIdRam);
	}
	listRam = [];
	$('.list-filter__ram li a').find('.check-filter-box').each(function() {
		var dataIdRam = $(this).parent().attr("data-id");
		if(dataIdRam == "duoi-4g") {
			listRam.push(["", "4"]);
		} else if(dataIdRam == "4gb-6gb") {
			listRam.push(["4", "6"]);
		} else if(dataIdRam == "tren-8gb") {
			listRam.push(["8", ""]);
		}
	})
	console.log(`Value of list RAM: ${JSON.stringify(listRam)}`);
})

/** Choose batery capicty */
$('.list-filter__pin .list-filter--pin').on('click', function(event) {
	event.preventDefault();
	console.log($(this))
	var dataIdPin = $(this).attr("data-id");
	// Kiểm tra xem trong conditon search đã có dataId hay chưa nếu chưa thì render còn không thì remove
	if(!checkExistConditionSearch(dataIdPin)) {
		var nameCondition = $(this).parent().text();
		renderConditionSearch(dataIdPin, nameCondition)
	} else {
		removeConditionSearch(dataIdPin);
	}
	listPin = [];
	$('.list-filter__pin li a').find('.check-filter-box').each(function() {
		var dataIdPin = $(this).parent().attr("data-id");
		if(dataIdPin == "duoi-3000") {
			listPin.push(["", "3000"]);
		} else if(dataIdPin == "tu-3000-4000") {
			listPin.push(["3000", "4000"]);
		} else if(dataIdPin == "tren-4000mah") {
			listPin.push(["4000", ""]);
		}
	})
	console.log(`Value of list pin: ${JSON.stringify(listPin)}`);
})

$('#btnSubmitSearch').on('click', function(event) {
	event.preventDefault();
	searchProductCondition(1, true);
})

/** Sort filter */
$('.sort-area .sort-area--link').on('click', function (event)
{
    event.preventDefault();
    if (!$(this).hasClass('check-sort'))
    {
        $(this).siblings().removeClass('check-sort');
        $(this).addClass('check-sort');
		var dataIdSort = $(this).attr("data-id");
		if(dataIdSort == "cao-den-thap") {
			sortBy = "DESC";
		} else if(dataIdSort == "thap-den-cao") {
			sortBy = "ASC";
		} else {
			sortBy = "";
		}
    }
})

/** Toggle filter */
$('.filter-box__title').click(function (){
	$('.list-filter').removeClass('d-none');
})

$('.btn-close-filter').click(function (){
	$('.list-filter').addClass('d-none');
})

/** Remove condition search by event click */
$('.condition-search__list').on('click', '.condition-search--link', function(event) {
	event.preventDefault();
	var dataIdRender = $(this).attr("data-id");
	var index = "";
	console.log(priceFrom)
	console.log(priceTo)
	switch(dataIdRender) {
		// PIN
		case "duoi-3000":
			index = ["", "3000"];
			break;
		case "tu-3000-4000":
			index = ["3000", "4000"];
			break;
		case "tren-4000mah":
			index = ["4000", ""];
			break;
		// RAM
		case "duoi-4g":
			index = ["", "4"];
			break;
		case "4gb-6gb":
			index = ["4", "6"];
			break;
		case "tren-8gb":
			index = ["8", ""];
			break;
		// Type product
		case "iPhone":
			index = listTypeProduct.indexOf('iPhone');
			break;
		case "Android":
			index = listTypeProduct.indexOf('Android');
			break;
		case "Điện thoại phổ thông":
			index = listTypeProduct.indexOf('Điện thoại phổ thông');
			break;
		// Price product
		case "5":
			/*priceFrom = "0";
			priceTo = "5000000";*/
			index = dataIdRender;
			break;
		case "5-10":
			/*priceFrom = "5000000";
			priceTo = "10000000";*/
			index = dataIdRender;
			break;
		case "10-15":
			/*priceFrom = "10000000";
			priceTo = "15000000";*/
			index = dataIdRender;
			break;
		case "15-20":
			/*priceFrom = "15000000";
			priceTo = "20000000";*/
			index = dataIdRender;
			break;
		case ">20":
			/*priceFrom = "20000000";*/
			index = dataIdRender;
			break;
		
	}
	
	/** Check and remove element list PIN */
	$('.list-filter__pin li a').find('.check-filter-box').each(function() {
		if($(this).parent().attr("data-id") == dataIdRender) {
			// Remove checked filter box
			console.log(priceFrom)
			console.log(priceTo)
			$(this).removeClass('check-filter-box');
			// Remove value of checked in list pin
			if(listPin.indexOf2d(index)) {
				var indexRemove = findIndexOfNestedArray(index, listPin);
				console.log(indexRemove);
				listPin.splice(indexRemove, 1);
			}
			console.log(priceFrom)
			console.log(priceTo)
		}
	})
	
	/** Check and remove element list RAM */
	$('.list-filter__ram li a').find('.check-filter-box').each(function() {
		if($(this).parent().attr("data-id") == dataIdRender) {
			// Remove checked filter box
			$(this).removeClass('check-filter-box');
			// Remove value of checked in list ram
			if(listRam.indexOf2d(index)) {
				var indexRemove = findIndexOfNestedArray(index, listRam);
				console.log(indexRemove);
				listRam.splice(indexRemove, 1);
			}
		}
	})
	
	/** Check and remove element list type product */
	$('.list-filter__type-phone li a').find('.check-filter-box').each(function() {
		if($(this).parent().attr("data-id") == dataIdRender) {
			// Remove checked filter box price
			$(this).removeClass('check-filter-box');
			// Remove value of checked in list type
			if(index != -1) {
				listTypeProduct.splice(index, 1);
			}
		}
	})
	
	/** Check and remove element price product */
	$('.search-product__price .search-product-list li a').each(function() {
		if($(this).attr("data-id") == dataIdRender) {
			$(this).parent().removeClass('check-price');
			priceFrom = "";
			priceTo = "";
		}
	})
	
	/** Check and remove element brand*/
	$('.listBrand').find('.li-enable').each(function() {
		if($(this).hasClass('li-enable') && ($(this).attr("data-name") == dataIdRender)) {
			var valueBrand = $(this).find('input[name="brand.logo"]').val()
			index = listBrandArr.indexOf(valueBrand);
			if(index != -1) {
				listBrandArr.splice(index, 1);
			}
			$(this).find(`input[value="${valueBrand}"]`).prop("checked", false);
			$(this).removeClass('li-enable');
		}
	})
	
	// Remove element condition search
	$(this).parent().remove();
	renderDeleteAll();
})

function findIndexOfNestedArray(nestedArray, searchArray) {
  return searchArray.findIndex(item => {
    return item.length === nestedArray.length && item.every((a, i) => a === nestedArray[i])
  })
}


Array.prototype.indexOf2d = function(item) {
    arrCoords = JSON.stringify(this.map(function(a){return a[0] + "|" + a[1]}));
    return arrCoords.indexOf(item[0] + "|" + item[1]) !== -1;
}

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

/** Search product with condition 
	@param pageNumber,
	@param isClickSearchBtn
	@returns List<ProdctItemModel>
*/
function searchProductCondition(pageNumber, isClickSearchBtn) {
	$('.list-filter').addClass('d-none');
	var searchCondition = {
		keyword: $('.search__input').val(),
		priceFrom: priceFrom,
		priceTo: priceTo,
		listBrandId: listBrandArr,
		listTypeProduct: listTypeProduct,
		listRam: listRam,
		listPin: listPin,
		sortBy: sortBy
	}
	console.log(`Điều kiện tìm kiếm: ${JSON.stringify(searchCondition)}`)
	$.ajax({
		url: '/user/api/search-product/' + pageNumber,
		type: 'POST',
		dataType: 'JSON',
		contentType: 'application/json',
		data: JSON.stringify(searchCondition),
		success: function(responseData) {
			if(responseData.data.productItemList.length == 0) {
				$('.outstanding-phone').addClass('d-none');
				$('.product-empty').removeClass('d-none');
			} else {
				$('.outstanding-phone').removeClass('d-none');
				$('.product-empty').addClass('d-none');
				renderProductApi(responseData.data.productItemList);
				renderPagination(responseData.data.paginationList);
				
				if(isClickSearchBtn) {
					showNotification(true, responseData.responseMsg);
				}
				if(responseData.data.paginationList.pageNumberList.length < 2) {
					$('.pagination').addClass("d-none");
				} else {
					$('.pagination').removeClass("d-none");
				}
			}	
		}
	})
}
/** Result search */
function renderMessageSearch(responseMsg) {
	$('#resultSearch p').empty();
	$('#resultSearch p').append(responseMsg);
}

/** Initial Search Condition */
function initialSeachCondtion() {
	$('.condition-search-box .condition-search__list').empty();
}

/** Render condition search */
function renderConditionSearch(dataId, nameCondition) {
	var rowHTML = "";
	rowHTML = ` <li class="condition-search--item"><a href="/" class="condition-search--link" data-id="${dataId}">${nameCondition}<i class="btn-close-condition"></i></a></li>`;
	$('.condition-search-box .condition-search__list').append(rowHTML);
	renderDeleteAll();
}

function renderConditionSearchPrice(dataId, nameCondition) {
	var rowHTML = "";
	rowHTML = `<li class="condition-search--item condition-search-item--price"><a href="/" class="condition-search--link" data-id="${dataId}">${nameCondition}<i class="btn-close-condition"></i></a></li>`;
	$('.condition-search-box .condition-search__list').append(rowHTML);
	renderDeleteAll();
}

/** Render delete all */
function renderDeleteAll() {
	$('.btn-delete-all-box').empty();
	if($('.condition-search-box .condition-search__list li').length >= 2) {
		$('.btn-delete-all-box').append(`
			<span class="condition-search--item btn-delete-all">
				<a href="/user/product" class="condition-search--link">
					Xóa tất cả<i class="btn-close-condition"></i>
				</a>
			</span>
		`);
	} else {
		$('.btn-delete-all').remove();
	}
}

/** Remove condition search by id */
function removeConditionSearch(dataId) {
	$('.condition-search__list .condition-search--item a').each(function() {
		if($(this).attr("data-id") == dataId) {
			$(this).parent().remove();
			renderDeleteAll();
		}
	})
}


/** Check exist condition search */
function checkExistConditionSearch(dataId) {
	var flag = false;
	$('.condition-search__list .condition-search--item a').each(function() {
		$(this).attr("data-id") == dataId ? flag = true : flag;
	})
	return flag;
}

/** Find all product
	@param pageNumber
	@returns List<ProductItemModel>
*/
function findAllProductWithApi(pageNumber) {
	$.ajax({
		url: '/user/api/product-items/' + pageNumber,
		type: 'GET',
		dataType: 'JSON',
		contentType: 'application/json',
		success: function(responseData) {
			renderProductApi(responseData.data.productItemList);
			renderPagination(responseData.data.paginationList);
			$('.pagination').removeClass("d-none");
			$('#resultSearch p').empty();
		}
	})
}

/** Render product 
	@param productItemList
*/
function renderProductApi(productItemList) {
	var rowHTML = "";
	var $outstandingPhone = $(".outstanding-phone .tab-content .tab-product  ul");
	$outstandingPhone.empty();
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
		$outstandingPhone.append(rowHTML);
		if(value.productEntity.unitPrice - value.salePrice <= 0) {
			$(`.product-${value.productEntity.productId}`).addClass("d-none");
		}
	})
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

