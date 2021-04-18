package com.smobile.service;

import java.util.List;

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.ResponseDataModel;

public interface IPurchaseService {

	/**
	 * 
	 * Find all purchase
	 * 
	 * @returnList<PurchaseEntity>
	 */
	List<PurchaseEntity> findAllPurchase();
	
	/**
	 * 
	 * Find purchase by id 
	 * 
	 * @param purchaseId
	 * @return PurchaseEntity
	 */
	PurchaseEntity findByPurchaseId(Integer purchaseId);
	
	/**
	 * 
	 * Add new purchase
	 * 
	 * @param purchaseEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewPurchase(PurchaseEntity purchaseEntity);
	
	/**
	 * 
	 * Update purchase 
	 * 
	 * @param purchaseEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updatePurchase(PurchaseEntity purchaseEntity);
	
	/**
	 * 
	 * Delete purchase by id
	 * 
	 * @param purchaseId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deletePurchaseById(Integer purchaseId);
	
	
	ResponseDataModel updateStatusPurchase(Integer purchaseId, Integer purchaseStatusId);
}
