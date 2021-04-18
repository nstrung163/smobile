package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductImageEntity;
import com.smobile.model.ResponseDataModel;

public interface IProductImageService {

	/**
	 * Get all product image
	 * 
	 * @return List<ProductImageEntity>
	 */
	List<ProductImageEntity> findAllProductImage();
	
	/**
	 * Find product by product image id
	 * 
	 * @param productImageId
	 * @return
	 */
	ProductImageEntity findByProductImageId(Integer productImageId);
	
	/**
	 * Add new product image 
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel addProductImage(ProductImageEntity productImageEntity);
	
	/**
	 * Update product image
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateProductImage(ProductImageEntity productImageEntity);
	
	/**
	 * Delete product image 
	 * 
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteProductImage(Integer productImageId);
	
}
