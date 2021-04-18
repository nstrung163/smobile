package com.smobile.service;

import java.util.List;

import com.smobile.entity.PurchaseDetailEntity;
import com.smobile.model.ResponseDataModel;

public interface IPurchaseDetailService  {

	/**
	 * 
	 * Get all purchase detail
	 * 
	 * @return List<PurchaseDetailEntity> 
	 */
	List<PurchaseDetailEntity> findAllPurchaseDetail();
	
	/**
	 * 
	 * Find purchase detail by id
	 * 
	 * @param purchaseDetailId
	 * @return PurchaseDetailEntity
	 */
	PurchaseDetailEntity findByPurchaseDetailId(Integer purchaseDetailId);
	
	/**
	 * 
	 * Add new purchase detail
	 * 
	 * @param purchaseDetailEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewPurchaseDetail(PurchaseDetailEntity purchaseDetailEntity);
	
	/**
	 * 
	 * Update purchase detail
	 * 
	 * @param purchaseDetailEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updatePurchaseDetail(PurchaseDetailEntity purchaseDetailEntity);
	
	/**
	 * 
	 * Delete purchase detail by id
	 * 
	 * @param purchaseDetailId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deletePurchaseDetailById(Integer purchaseDetailId);
}
