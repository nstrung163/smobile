package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.RateProductEntity;

public interface IRateProductRepository extends JpaRepository<RateProductEntity, Integer> {

	RateProductEntity findByRateId(Integer rateProductId);
	
}
