package com.smobile.service;

import com.smobile.model.ProductItemModel;

public interface ICartService {

	void addProductViewed(Integer productId);
	
	void removeProductViewed();
	
	ProductItemModel convertProductToProductItemModel(Integer productId);
}
