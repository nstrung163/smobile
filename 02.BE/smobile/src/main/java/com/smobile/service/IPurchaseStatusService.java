package com.smobile.service;

import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.model.ResponseDataModel;

public interface IPurchaseStatusService {
	
	/**
	 * Check duplicate purchase status name when add new Purchase Status
	 * 
	 * @param purStatusName
	 * @return PurchaseStatusEntity
	 */
	PurchaseStatusEntity findByPurchaseStatusName(String purStatusName);
	
	/**
	 * Add new purchase status
	 * 
	 * @param purStatus
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewPurStatus(PurchaseStatusEntity purStatus);
	
	/**
	 * Update purchase status by id
	 * 
	 * @param purStatusEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updatePurStatus(PurchaseStatusEntity purStatusEntity);
	
	/**
	 * Find purchase status by purchase status id
	 * 
	 * @param pusStatusId
	 * @return PurchaseStatusEntity
	 */
	PurchaseStatusEntity findByPurchaseStatusId(Integer pusStatusId);
	
	/**
	 * Delete purchase status by id
	 * 
	 * @param pusStatusId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deletePurStatusById(Integer pusStatusId);
}
