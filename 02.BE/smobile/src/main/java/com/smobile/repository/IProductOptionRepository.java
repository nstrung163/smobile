package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductOptionEntity;

public interface IProductOptionRepository extends JpaRepository<ProductOptionEntity, Integer> {

	ProductOptionEntity findByProductOptionId(Integer productOptionId);

	@Query(value = "SELECT * FROM PRODUCT_OPTION WHERE MEMORY_PRODUCT = ?1 AND PRODUCT_ID = ?2", nativeQuery = true)
	List<ProductOptionEntity> findByMemoryAndProductId(int memoryProduct, Integer productId);

	@Query(value = "SELECT * FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?1 LIMIT 1", nativeQuery = true)
	ProductOptionEntity findProductOptionByProductId(Integer productId);

	@Query(value = "SELECT MIN(SALE_PRICE) FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?1", nativeQuery = true)
	Double getSalePriceDefault(Integer productId);

	@Query(value = "SELECT DISTINCT P.PRODUCT_ID, P.MEMORY_PRODUCT, P.SALE_PRICE "
				 + "FROM PRODUCT_OPTION P "
				 + "WHERE P.PRODUCT_ID = ?1 "
				 + "ORDER BY P.MEMORY_PRODUCT ASC", nativeQuery = true)
	List<Object[]> getListProductByMemoryPrice(Integer productId);
	
	/**
	 * 
	 * Get sale price for cartModel
	 * 
	 * @param productOptionId
	 * @return Double
	 */
	@Query(value = "SELECT SALE_PRICE FROM PRODUCT_OPTION WHERE PRODUCT_OPTION_ID = ?1", nativeQuery = true)
	double getSalePriceByProductOptionId(Integer productOptionId);
}
