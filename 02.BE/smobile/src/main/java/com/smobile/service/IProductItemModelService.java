package com.smobile.service;

import com.smobile.model.ResponseDataModel;

public interface IProductItemModelService {

	ResponseDataModel findAllProductItem();
	
	ResponseDataModel getProductOutstanding();
}
