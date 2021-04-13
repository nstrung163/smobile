package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.BrandEntity;

public interface IBrandRepository extends JpaRepository<BrandEntity, Integer> {

	BrandEntity findByBrandId(Integer brandId);
	
	BrandEntity findByBrandName(String brandName);
	
	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Integer brandId);
}
