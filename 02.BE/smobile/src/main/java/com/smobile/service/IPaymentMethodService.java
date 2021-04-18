package com.smobile.service;

import com.smobile.model.ResponseDataModel;

import com.smobile.entity.PaymentMethodEntity;

import java.util.List;

public interface IPaymentMethodService {

	/**
	 * Get all payment method
	 * 
	 * @returnList<PaymentMethodEntity>
	 */
	List<PaymentMethodEntity> findAllPaymentMethod();
	
	/**
	 * Find payment method id
	 * 
	 * @param payMethodId
	 * @return PaymentMethodEntity
	 */
	PaymentMethodEntity findByPaymentMethodId(Integer payMethodId);
	
	/**
	 * Add new payment method
	 * 
	 * @param paymentMethodEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewPaymentMethod(PaymentMethodEntity paymentMethodEntity);
	
	/**
	 * Update payment method
	 * 
	 * @param paymentMethodEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updatePaymentMethod(PaymentMethodEntity paymentMethodEntity);
	
	/**
	 * Delete payment method by id
	 * 
	 * @param payMethodId
	 * @return ResponseDataModel
	 */ 
	ResponseDataModel deletePaymentMethod(Integer payMethodId);
}
