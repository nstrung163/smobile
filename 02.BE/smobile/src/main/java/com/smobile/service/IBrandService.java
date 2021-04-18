package com.smobile.service;

import java.util.List;

import com.smobile.entity.BrandEntity;
import com.smobile.model.ResponseDataModel;

public interface IBrandService {

	/**
	 * Get all brand
	 * 
	 * @return ResponseDataModel
	 * 
	 */
	List<BrandEntity> findAllBrand();
	
	/**
	 * Add new brand 
	 * 
	 * @param brandEntity
	 * @return ResponseDataModel
	 * 
	 */
	ResponseDataModel addNewBrand(BrandEntity brandEntity);
	
	/**
	 * Update brand
	 * 
	 * @param brandEntity
	 * @return ResponseDataModel
	 * 
	 */
	ResponseDataModel updateBrand(BrandEntity brandEntity);
	
	/**
	 * Delete brand by id
	 * 
	 * @param brandId
	 * @return ResponseDataModel
	 * 
	 */ 
	ResponseDataModel deleteBrandById(Integer brandId);
	
	/**
	 * Find brand by id
	 * 
	 * @param bradId
	 * @return BrandEntity
	 * 
	 */
	BrandEntity findByBrandId(Integer bradId);
	
}
