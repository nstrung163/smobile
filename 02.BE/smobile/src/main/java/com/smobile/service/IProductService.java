package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductEntity;
import com.smobile.model.ResponseDataModel;

public interface IProductService {

	/**
	 * Get all product
	 * 
	 * @returnList<ProductEntity>
	 */
	List<ProductEntity> findAllProduct();
	
	/**
	 * Find product by id
	 * 
	 * @param productId
	 * @return ProductEntity
	 */
	ProductEntity findByProductId(Integer productId);
	
	/**
	 * Add new product
	 * 
	 * @param productEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewProduct(ProductEntity productEntity);
	
	/**
	 * Update product 
	 * 
	 * @param productEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateProduct(ProductEntity productEntity);
	
	/**
	 * Delete product by product id
	 * 
	 * @param productId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteProductById(Integer productId);
	
}
