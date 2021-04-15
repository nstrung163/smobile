package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.ProductOptionEntity;

public interface IProductOptionRepository extends JpaRepository<ProductOptionEntity, Integer>{

	ProductOptionEntity findByProductOptionId(Integer productOptionId);
	
}
