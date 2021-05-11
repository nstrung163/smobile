package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.smobile.entity.ProductCommentEntity;

public interface IProductCommentRepository extends JpaRepository<ProductCommentEntity, Integer> {

	@Query(value = "SELECT * FROM PRODUCT_COMMENT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	List<ProductCommentEntity> getListProductCommentByProductId(Integer productId);
	
	@Query(value = "SELECT COUNT(RATE_NUMBER) FROM PRODUCT_COMMENT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	int getTotalRateByProductId(Integer productId);
	
	@Query(value = "SELECT AVG(RATE_NUMBER) FROM PRODUCT_COMMENT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	Float getAveragePointRate(Integer productId);
	
	@Query(value = "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM PRODUCT_COMMENT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 5 \r\n"
					+ "UNION ALL\r\n"
					+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM PRODUCT_COMMENT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 4\r\n"
					+ "UNION ALL\r\n"
					+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM PRODUCT_COMMENT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 3\r\n"
					+ "UNION ALL\r\n"
					+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM PRODUCT_COMMENT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 2\r\n"
					+ "UNION ALL\r\n"
					+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM PRODUCT_COMMENT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 1", nativeQuery = true)
	List<Integer> getListTotalRateEachRate(@Param("productId") Integer productId);
	
	ProductCommentEntity findByCommentId(Integer commnetId);
	
	@Query(value = "SELECT PC.PRODUCT_ID, PC.COMMENT_CONTENT, PC.DATE_OF_COMMENT, PC.IMAGE_COMMENT_URL, PC.RATE_NUMBER, U.FULL_NAME, U.AVATAR_URL\r\n"
					+ "FROM PRODUCT_COMMENT AS PC JOIN USER AS U ON PC.USER_ID = U.USER_ID\r\n"
					+ "WHERE PC.PRODUCT_ID = :productId "
					+ "ORDER BY COMMENT_ID DESC", nativeQuery = true)
	List<Object[]> getAllProductCommentModel(@Param("productId") Integer productId);
	
	@Query(value = "SELECT PC.PRODUCT_ID, PC.COMMENT_CONTENT, PC.DATE_OF_COMMENT, PC.IMAGE_COMMENT_URL, PC.RATE_NUMBER, U.FULL_NAME, U.AVATAR_URL\r\n"
					+ "FROM PRODUCT_COMMENT AS PC JOIN USER AS U ON PC.USER_ID = U.USER_ID\r\n"
					+ "WHERE PC.PRODUCT_ID = :productId "
					+ "ORDER BY COMMENT_ID DESC LIMIT 3", nativeQuery = true)
	List<Object[]> getTop3ProductCommentModel(@Param("productId") Integer productId);
}
