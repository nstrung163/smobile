package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductCommentEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.model.ProductItemModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.model.SearchCondition;

public interface IProductResponseService {

	/**
	 * 
	 * Find all product item
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel findAllProductItem();
	
	/**
	 * 
	 * Get ten product discount highest
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel getTenProductDiscountHighest();
	
	/**
	 * 
	 * Find all product with page number
	 * 
	 * @param pageNumber
	 * @return ResponseDataModel
	 */
	ResponseDataModel findAllProductApi(int pageNumber);
	
	/**
	 * 
	 * Get product outstanding for title, 3 products
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel getProductOutstanding();
	
	/**
	 * 
	 * Find product detail by product id
	 * 
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel findProductDetailById(Integer productId);
	
	/**
	 * 
	 * Get list product option by memory product and product id
	 * 
	 * @param memoryProduct
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel getListProductOptionByMemoryAndProductId(int memoryProduct, Integer productId);
	
	/**
	 *  
	 * Get search condition model
	 * 
	 * @param searchConditionMap
	 * @return ResponseDataModel
	 */
	ResponseDataModel getSearchCondition(SearchCondition searchConditionMap, int pageNumber);
	
	/**
	 * 
	 * Convert product entity to product item model
	 * 
	 * @param productList
	 * @return List<ProductItemModel>
	 */
	List<ProductItemModel> convertProductEntityToProductItemModel(List<ProductEntity> productList);
	
	/**
	 * 
	 * Add new comment and rate for product
	 * 
	 * @param productCommentEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewRateAndComment(ProductCommentEntity productCommentEntity);
	
	/**
	 * 
	 * Get all product comment and rate by product id
	 * 
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel getAllCommentProduct(Integer productId);
	
	/**
	 * 
	 * Add product viewed
	 * 
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel addProductViewed(Integer productId);
	
	/**
	 * 
	 * Remove product viewed
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel removeProductViewed();
	
	/**
	 * 
	 * Convert product entity to product item model
	 * 
	 * @param productId
	 * @return ProductItemModel
	 */
	ProductItemModel convertProductToProductItemModel(Integer productId);
	
	/**
	 * 
	 * Find product related by product id
	 * 
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel findProductRelatedByProductId(Integer productId);
}

