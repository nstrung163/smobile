package com.training.service;

import java.util.List;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;

public interface IBrandService {

	/**
	 * Find brand by brand name
	 * 
	 * @param brandName
	 * @return brand
	 */
	BrandEntity findByBrandName(String brandName);

	/**
	 * Find all brand with page 
	 * 
	 * @param pageNumber
	 * 
	 */
	ResponseDataModel findAllWithPageApi(int pageNumber);

	/**
	 * Add new brand 
	 * 
	 * @param brandEntity
	 * 
	 */
	ResponseDataModel addApi(BrandEntity brandEntity);

	/**
	 * Delete brand by brand id
	 * 
	 * @param brandId
	 * 
	 */
	ResponseDataModel deleteApi(Long brandId);
	/**
	 * Update brand by brand id
	 * 
	 * @param brandEntity
	 * 
	 */
	ResponseDataModel updateApi(BrandEntity brandEntity);
	
	/**
	 * Find brand by brand Id
	 * 
	 * @param brandId
	 * @return brand
	 */
	ResponseDataModel findBrandByIdApi(Long brandId);

	
	/**
	 * Get all brand
	 */
	List<BrandEntity> getAll();
	
	/**
	 * Search brand by brand nam
	 * 
	 * @param brandName
	 * @param pageNumber
	 * @return list brand
	 */
	ResponseDataModel searchApi(String brandName, int pageNumber);

}
