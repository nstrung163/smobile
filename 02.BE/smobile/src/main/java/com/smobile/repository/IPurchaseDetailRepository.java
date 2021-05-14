package com.smobile.repository;

import com.smobile.entity.PurchaseDetailEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IPurchaseDetailRepository extends JpaRepository<PurchaseDetailEntity, Integer> {

	PurchaseDetailEntity findByPurchaseDetailId(Integer purchaseDetailId);
	
	@Query(value = "SELECT * FROM PURCHASE_DETAIL WHERE PURCHASE_ID = ?1", nativeQuery = true)
	List<PurchaseDetailEntity> getListPurchaseDetailByPurchaseId(Integer purchaseId);
	
}
