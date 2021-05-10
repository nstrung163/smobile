package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.smobile.entity.RateProductEntity;

public interface IRateProductRepository extends JpaRepository<RateProductEntity, Integer> {

	RateProductEntity findByRateId(Integer rateProductId);
	
	@Query(value = "SELECT COUNT(*) FROM RATE_PRODUCT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	int getTotalRateByProductId(Integer productId);
	
	@Query(value = "SELECT AVG(RATE_NUMBER) FROM RATE_PRODUCT WHERE PRODUCT_ID = ?1", nativeQuery = true)
	Float getAveragePointRate(Integer productId);
	
	@Query(value = "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM RATE_PRODUCT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 5 \r\n"
				+ "UNION ALL\r\n"
				+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM RATE_PRODUCT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 4\r\n"
				+ "UNION ALL\r\n"
				+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM RATE_PRODUCT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 3\r\n"
				+ "UNION ALL\r\n"
				+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM RATE_PRODUCT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 2\r\n"
				+ "UNION ALL\r\n"
				+ "SELECT COUNT(RATE_NUMBER) AS RATE_TOTAL FROM RATE_PRODUCT WHERE PRODUCT_ID = :productId AND RATE_NUMBER = 1", nativeQuery = true)
	List<Integer> getListTotalRateEachRate(@Param("productId") Integer productId);
}
