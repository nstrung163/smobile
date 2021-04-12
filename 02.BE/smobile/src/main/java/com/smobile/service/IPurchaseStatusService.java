package com.smobile.service;

import com.smobile.entity.PurchaseStatusEntity;

public interface IPurchaseStatusService {
	
	/**
	 * Add new purchase status
	 * 
	 * @param purStatus
	 * @return PurchaseStatusEntity
	 * 
	 */
	PurchaseStatusEntity addNewPurStatus(PurchaseStatusEntity purStatus);
}
