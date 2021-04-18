package com.smobile.service;

import com.smobile.model.ResponseDataModel;

import com.smobile.entity.RateProductEntity;

import java.util.List;

public interface IRateProductService {

	/**
	 * 
	 * Get all rate product
	 * 
	 * @return List<RateProductEntity>
	 */
	List<RateProductEntity> findAllRateProduct();

	/**
	 * 
	 * Find rate product by id
	 * 
	 * @param rateId
	 * @return RateProductEntity
	 */
	RateProductEntity findByRateId(Integer rateId);

	/**
	 * 
	 * Ad new rate product
	 * 
	 * @param rateProductEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewRateProduct(RateProductEntity rateProductEntity);

	/**
	 * 
	 * Update rate product
	 * 
	 * @param rateProductEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateRateProduct(RateProductEntity rateProductEntity);

	/**
	 * 
	 * Delete rate product by id
	 * 
	 * @param rateProductId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteRateProductById(Integer rateProductId);

}
