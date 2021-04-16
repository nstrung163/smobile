package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductEntity;

public interface IProductRepository extends JpaRepository<ProductEntity, Integer> {

	ProductEntity findByProductId(Integer productId);
	
	ProductEntity findByProductName(String productName);
	
	ProductEntity findByProductNameAndProductIdNot(String productName, Integer productId);
	
	@Query(value = "SELECT COUNT(P.PRODUCT_ID) FROM PRODUCT AS P WHERE P.PRODUCT_ID = ?1", nativeQuery = true)
	Integer checkExistesProduct(Integer producId);
	
	@Query(value = "SELECT P.* FROM PRODUCT AS P WHERE P.PRODUCT_ID = ?1", nativeQuery = true)
	ProductEntity checkExistesProductTest(Integer producId);
}
