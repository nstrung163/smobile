package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductInfoEntity;

public interface IProductInfoRepository extends JpaRepository<ProductInfoEntity, Integer>{

	ProductInfoEntity findByProductInfoId(Integer productInfoId);
	
	@Query(value = "SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = ?1", nativeQuery = true)
	ProductInfoEntity findByProductId(Integer productId);
	
}
