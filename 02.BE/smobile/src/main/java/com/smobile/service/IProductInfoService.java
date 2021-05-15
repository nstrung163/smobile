package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductInfoEntity;
import com.smobile.model.ResponseDataModel;

public interface IProductInfoService {

	/**
	 * Get all product info
	 * 
	 * @return List<ProductInfoEntity>
	 */
	List<ProductInfoEntity> findAllProductInfo();
	
	/**
	 * Find product info by id
	 * 
	 * @param productId
	 * @return ProductInfoEntity
	 */
	ProductInfoEntity findByProductInfoId(Integer productId);
	
	/**
	 * Add new product info
	 * 
	 * @param productInfoEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewProductInfo(ProductInfoEntity productInfoEntity);
	
	/**
	 * Update product info
	 * 
	 * @param productInfoEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateProductInfo(ProductInfoEntity productInfoEntity);
	
	/**
	 * Delete product info by id
	 * 
	 * @param productInfoId
	 * @return ResponseDataModel
	 */ 
	ResponseDataModel deleteProductInfo(Integer productInfoId);
	
}
