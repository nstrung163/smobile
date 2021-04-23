package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductImageEntity;

public interface IProductImageRepository extends JpaRepository<ProductImageEntity, Integer> {

	ProductImageEntity findByProductImageId(Integer productImageId);
	
	@Query(value = "SELECT IMAGE_URL FROM PRODUCT_IMAGE WHERE PRODUCT_ID = ?1 LIMIT 1", nativeQuery = true)
	String getFirstImageUrlByProductId(Integer productId);
	
	@Query(value = "SELECT IMAGE_URL FROM PRODUCT_IMAGE WHERE PRODUCT_ID = ?1", nativeQuery = true)
	List<String> getListImageByProductId(Integer productId);
}
