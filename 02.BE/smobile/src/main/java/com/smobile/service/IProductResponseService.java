package com.smobile.service;

import java.util.List;

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.PurchaseModel;
import com.smobile.model.ResponseDataModel;

public interface IProductResponseService {

	ResponseDataModel findAllProductItem();
	
	ResponseDataModel getProductOutstanding();
	
	ResponseDataModel findProductDetailById(Integer productId);
	
	ResponseDataModel getListProductOptionByMemoryAndProductId(int memoryProduct, Integer productId);
	
//	ResponseDataModel getListOptionMemoryPrice(Integer productId);
	
	CartModel addProductToCart(Integer productOptionId);
	
	ResponseDataModel checkoutCart(PurchaseEntity purchaseEntity);
	
	ResponseDataModel addProductQuantity(Integer productOptionId);
	
	List<PurchaseModel> getListHistoryBuy(Integer userId);
}
