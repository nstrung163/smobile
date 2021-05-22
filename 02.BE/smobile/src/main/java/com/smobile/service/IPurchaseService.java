package com.smobile.service;

import java.util.List;

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.IPurchaseQuantity;
import com.smobile.model.IRevenuePrice;
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
	
	/**
	 * 
	 * Update status purchase by purchase Id and purchase status id
	 * 
	 * @param purchaseId
	 * @param purchaseStatusId
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateStatusPurchase(Integer purchaseId, Integer purchaseStatusId, int quantity, Integer purchaseDetailId);
	
	/**
	 * 
	 * Get a list quantity of purchase each month of the year
	 * 
	 * @param year
	 * @return List<IPurchaseQuantity>
	 */
	List<IPurchaseQuantity> getListPurchaseQuantityEachMonth(Integer year);
	
	/**
	 * 
	 * Get a list of total revenue price each month of the year
	 * 
	 * @param year
	 * @return List<IRevenuePrice>
	 */
	List<IRevenuePrice> getListRevenueEachMonth(Integer year);
	
}
