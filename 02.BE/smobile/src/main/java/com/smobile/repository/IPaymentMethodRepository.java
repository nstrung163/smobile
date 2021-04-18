package com.smobile.repository;

import com.smobile.entity.PaymentMethodEntity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface IPaymentMethodRepository extends JpaRepository<PaymentMethodEntity, Integer> {

	PaymentMethodEntity findByPaymentMethodId(Integer paymentMethodId);
	
	PaymentMethodEntity findByPaymentMethodName(String paymentMethodName);
	
	PaymentMethodEntity findByPaymentMethodNameAndPaymentMethodIdNot(String paymentMethodName, Integer paymentMethodEId);
}
