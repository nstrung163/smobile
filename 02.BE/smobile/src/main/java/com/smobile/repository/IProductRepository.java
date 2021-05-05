package com.smobile.repository;

import java.util.List;

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
	
	@Query(value = "SELECT * FROM PRODUCT LIMIT 5", nativeQuery = true)
	List<ProductEntity> findProductOutstanding();
	
	@Query(value = "SELECT * FROM PRODUCT LIMIT 10", nativeQuery = true)
	List<ProductEntity> get10Product();
	
	@Query(value = "SELECT P.* FROM PRODUCT_OPTION AS PO JOIN PRODUCT AS P ON PO.PRODUCT_ID = P.PRODUCT_ID WHERE PO.PRODUCT_OPTION_ID = ?1", nativeQuery = true)
	ProductEntity findProductByProductOptionId(Integer productOptionId);
}
