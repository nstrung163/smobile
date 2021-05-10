package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductEntity;
import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.PurchaseModel;
import com.smobile.model.RateCommentModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.model.SearchCondition;

public interface IProductResponseService {

	ResponseDataModel findAllProductItem();
	 
	ResponseDataModel findAllProcuctApi(int pageNumber);
	
	ResponseDataModel getProductOutstanding();
	
	ResponseDataModel findProductDetailById(Integer productId);
	
	ResponseDataModel getListProductOptionByMemoryAndProductId(int memoryProduct, Integer productId);
	
//	ResponseDataModel getListOptionMemoryPrice(Integer productId);
	
	CartModel addProductToCart(Integer productOptionId);
	
	ResponseDataModel checkoutCart(PurchaseEntity purchaseEntity);
	
	ResponseDataModel addProductQuantity(Integer productOptionId);
	
	List<PurchaseModel> getListHistoryBuy(Integer userId);
	
	List<PurchaseModel> getAllPurchaseDetail();
	
	List<PurchaseModel> getPurchaseDetailById(Integer purchaseDetailId);
	
	/**
	 *  
	 * Get search condition map
	 * 
	 * @param searchConditionMap
	 * @return ResponseDataModel
	 */
	ResponseDataModel getSearchCondition(SearchCondition searchConditionMap, int pageNumber);
	
	List<ProductItemModel> convertProductEntityToProductItemModel(List<ProductEntity> productList);
	
	ResponseDataModel addNewRateAndComment(RateCommentModel rateCommentModel);
}

