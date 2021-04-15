package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.ProductImageEntity;

public interface IProductImageRepository extends JpaRepository<ProductImageEntity, Integer> {

	ProductImageEntity findByProductImageId(Integer productImageId);
	
}
