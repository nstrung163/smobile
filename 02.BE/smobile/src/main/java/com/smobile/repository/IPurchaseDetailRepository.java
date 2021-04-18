package com.smobile.repository;

import com.smobile.entity.PurchaseDetailEntity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface IPurchaseDetailRepository extends JpaRepository<PurchaseDetailEntity, Integer> {

	PurchaseDetailEntity findByPurchaseDetailId(Integer purchaseDetailId);
	
}
