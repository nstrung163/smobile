package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductCommentEntity;

public interface IProductCommentRepository extends JpaRepository<ProductCommentEntity, Integer> {

	@Query(value = "SELECT * FROM PRODUCT_COMMENT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	List<ProductCommentEntity> getListProductCommentByProductId(Integer productId);
	
	ProductCommentEntity findByCommentId(Integer commnetId);
}
