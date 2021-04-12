package com.training.service;

import java.util.Map;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;

public interface IProductService {

	/**
	 * Find product by product nam
	 * 
	 * @param productName
	 * @return product
	 * 
	 */
	ProductEntity findByProductName(String productName);

	/**
	 * Find all product with page
	 * 
	 * @param pageNumber
	 * @return pages
	 */
	ResponseDataModel findAllProductWithPage(int pageNumber);
	
	/**
	 * Add new product 
	 * 
	 * @param productEntity
	 * 
	 */
	ResponseDataModel addProduct(ProductEntity productEntity);

	/**
	 * Delete product by id
	 * 
	 * @param productId
	 * 
	 */
	ResponseDataModel deleteProduct(Long productId);

	/**
	 * Update product by id 
	 * 
	 * @param productEntity
	 * 
	 */
	ResponseDataModel updateProduct(ProductEntity productEntity);
	
	/**
	 * Find product by product id
	 * 
	 * @param productId
	 * @return product
	 * 
	 */
	ResponseDataModel findProductById(Long productId);

	/**
	 * Search product with conditions
	 * 
	 * @param searchConditions
	 * @param pageNumber
	 * @return pages
	 * 
	 */
	ResponseDataModel searchProductWithConditions(Map<String, Object> searchConditions, int pageNumber);

}
