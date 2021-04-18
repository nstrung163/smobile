package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.PurchaseEntity;

public interface IPurchaseRepository extends JpaRepository<PurchaseEntity, Integer> {

	PurchaseEntity findByPurchaseId(Integer purchasetId);
	
}
