$(function() {
	var $categoryIdTemp = 0;
	var $sortType = 0;
	findAllProduct(1);
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr("data-index");
		console.log('$sortType' + $sortType);
		if($categoryIdTemp) {
			searchProductByCategoryId($categoryIdTemp, pageNumber);
		} else if($sortType) {
			findProductSalePrice($sortType, pageNumber);
		} else {
			findAllProduct(pageNumber);
		}
		
	})
	$('.product-search').on('click', function() {
		$('select option[value="0"]').attr("selected",true);
		$('.product-search').removeClass('active');
		$(this).addClass('active');
		$categoryIdTemp = $(this).data("id");
		searchProductByCategoryId($(this).data("id"), 1);
	})
	
	$('select').on('change', function() {
		$sortType = $(this).val();
		findProductSalePrice(this.value, 1);
	})
})

function searchProductByCategoryId(id, pageNumber) {
	$('#message-search').empty();
	$.ajax({
		url: '/search/category/'+ id +'/products/' + pageNumber,
		type: 'GET',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderProduct(responseData.data.products);
				
				if(responseData.data.products.length > 0) {
					renderPagination(responseData.data.paginationList)
				} else {
					$('#message-search').append('Not found products about this category!');
				}
				
				if (responseData.data.paginationList.pageNumberList.length < 2) {
					$('.pagination').addClass("d-none");
				} else {
					$('.pagination').removeClass("d-none");
				}
			}
		},
		error: function(e) {
			alert('Get all product failed ' + e);
		}
	})

}

function findAllProduct(pageNumber) {
	$.ajax({
		url: '/search/category/' + pageNumber,
		type: 'GET',
		contentType: 'application/json',
		success: function(responseData) {
			if(responseData.responseCode == 100) {
				renderProduct(responseData.data.products);
				renderPagination(responseData.data.paginationList)
			}
			console.log('Find all product success!');
		},
		error: function(e) {
			alert('Get all product failed ' + e);
		}
	})
}

function findProductSalePrice(sortType, pageNumber) {
	var sortTypeTemp = sortType == 1 ? 'asc/': (sortType == 2 ? 'desc/': ( sortType == 3 ? 'newProduct/' : ''));
	console.log('sortTypeTemp:' + sortTypeTemp)
	$.ajax({
	url: '/search/category/' + sortTypeTemp + pageNumber,
	type: 'GET',
	contentType: 'application/json',
	success: function(responseData) {
		if(responseData.responseCode == 100) {
			renderProduct(responseData.data.products);
			renderPagination(responseData.data.paginationList)
		}
	},
	error: function(e) {
		alert('Get all product failed ' + e);
	}
})
}

function renderProduct(products) {
	var rowHTML = "";
	var $listProducts = $('#listProducts');
	$listProducts.empty();
	$.each(products, function(key, value) {
		rowHTML = `<div class="col-6 col-lg-3 col-md-4  ">
						<div class="category-box">
							<img src="/uploads/images/${ value.imageUrl }" alt="${ value.productName }" width="100%" class="img img-responsive">
							<p class="category-name">${ value.productName }</p>
							<div class="card-text text-left font-weight-bold d-flex justify-content-center">
								<span class="product__price product__price-old">${ value.longPrice }đ</span>
								<span class="product__price product__price-new">${ value.longSalePrice }đ</span>
							</div>
							<a href="/product/${ value.productId }" class="btn  margin__btn-add-cart m-auto">Xem sản phẩm</a>
						</div>
					</div>`;
		$listProducts.append(rowHTML);
	})
}

/* Pagination */
function renderPagination(paginationList) {
	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > &laquo; </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > &raquo; </a></li>'
		$("ul.pagination").append(paginationInnerHtml);

	}
}