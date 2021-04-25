package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.smobile.entity.ProductCommentEntity;

public interface IProductCommentRepository extends JpaRepository<ProductCommentEntity, Integer> {

	@Query(value = "SELECT * FROM PRODUCT_COMMENT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	List<ProductCommentEntity> getListProductCommentByProductId(Integer productId);
	
	ProductCommentEntity findByCommentId(Integer commnetId);
	
	@Query(value = "SELECT PM.COMMENT_CONTENT, PM.DATE_OF_COMMENT, U.FULL_NAME, U.AVATAR_URL, RP.RATE_NUMBER\r\n"
					+ "FROM PRODUCT AS P \r\n"
					+ "JOIN (SELECT PC.* FROM PRODUCT_COMMENT AS PC JOIN PRODUCT AS P ON PC.PRODUCT_ID = P.PRODUCT_ID WHERE PC.PRODUCT_ID = :productId) AS PM ON P.PRODUCT_ID = PM.PRODUCT_ID \r\n"
					+ "JOIN USER AS U ON PM.USER_ID = U.USER_ID \r\n"
					+ "JOIN (SELECT R.* FROM RATE_PRODUCT AS R JOIN PRODUCT AS P ON R.PRODUCT_ID = P.PRODUCT_ID WHERE R.PRODUCT_ID = :productId) AS RP ON RP.USER_ID = U.USER_ID ", nativeQuery = true)
	List<Object[]> getProductCommentModel(@Param("productId") Integer productId);
}
