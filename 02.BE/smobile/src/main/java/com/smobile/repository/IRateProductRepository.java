package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.RateProductEntity;

public interface IRateProductRepository extends JpaRepository<RateProductEntity, Integer> {

	RateProductEntity findByRateId(Integer rateProductId);
	
	@Query(value = "SELECT COUNT(*) FROM RATE_PRODUCT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	int getTotalRateByProductId(Integer productId);
	
	@Query(value = "SELECT AVG(RATE_NUMBER) FROM RATE_PRODUCT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	Float getAveragePointRate(Integer productId);
	
}
