package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ProductMemoryPriceModel;

public interface IProductOptionRepository extends JpaRepository<ProductOptionEntity, Integer> {

	ProductOptionEntity findByProductOptionId(Integer productOptionId);

	@Query(value = "SELECT * FROM PRODUCT_OPTION WHERE MEMORY_PRODUCT = ?1 AND PRODUCT_ID = ?2", nativeQuery = true)
	List<ProductOptionEntity> findByMemoryAndProductId(int memoryProduct, Integer productId);

//	@Query(value = "SELECT DISTINCT MEMORY_PRODUCT FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?1", nativeQuery = true)
//	List<Integer> getListMemoryProductByProductId(Integer productId);

	@Query(value = "SELECT * FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?1 LIMIT 1", nativeQuery = true)
	ProductOptionEntity findProductOptionByProductId(Integer productId);

	@Query(value = "SELECT MIN(SALE_PRICE) FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?1", nativeQuery = true)
	Double getSalePriceDefault(Integer productId);

//	@Query(value = "SELECT new com.smobile.model.ProductMemoryPriceModel(p.product_id, p.memory_product, p.sale_price)  FROM PRODUCT_OPTION AS p")
//	List<ProductMemoryPriceModel> getListProductByMemoryPirce(Integer productId);
	
}
