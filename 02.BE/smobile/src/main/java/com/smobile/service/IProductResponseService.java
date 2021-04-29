package com.smobile.service;

import com.smobile.model.CartModel;
import com.smobile.model.ResponseDataModel;

public interface IProductResponseService {

	ResponseDataModel findAllProductItem();
	
	ResponseDataModel getProductOutstanding();
	
	ResponseDataModel findProductDetailById(Integer productId);
	
	ResponseDataModel getListProductOptionByMemoryAndProductId(int memoryProduct, Integer productId);
	
//	ResponseDataModel getListOptionMemoryPrice(Integer productId);
	
	CartModel addProductToCart(Integer productOptionId);
}
