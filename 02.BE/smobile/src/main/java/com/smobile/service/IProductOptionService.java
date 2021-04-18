package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ResponseDataModel;

public interface IProductOptionService {

	/**
	 * Find all product option
	 * 
	 * @return List<ProductOptionEntity>
	 */
	List<ProductOptionEntity> findAllProductOption();
	
	/**
	 * Find product option by product option id
	 * 
	 * @param productOptionId
	 * @return ProductOptionEntity
	 */
	
	ProductOptionEntity findByProductOption(Integer productOptionId);
	
	/**
	 * Add new product option 
	 * 
	 * @param productOptionEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewProductOption(ProductOptionEntity productOptionEntity);
	
	/**
	 * Update product option
	 * 
	 * @param productOptionEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateProductOption(ProductOptionEntity productOptionEntity);
	
	/**
	 * Delete product option by product option id
	 * 
	 * @param productOptionId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteProductOption(Integer productOptionId);
}
