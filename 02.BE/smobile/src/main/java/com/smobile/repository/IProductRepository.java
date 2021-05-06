package com.smobile.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.logging.log4j.util.Strings;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.util.CollectionUtils;

import com.smobile.entity.BrandEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;

public interface IProductRepository extends JpaRepository<ProductEntity, Integer>, JpaSpecificationExecutor<ProductEntity> {

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
	
	// Search product
	
	public static Specification<ProductEntity> getSearchCondition(Map<String, Object> searchconditionMap) {
		return new Specification<ProductEntity>() {
			
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<ProductEntity> productRoot, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				if( searchconditionMap != null) {
					String searchText = (String) searchconditionMap.get("keyword");
					String priceFrom = (String) searchconditionMap.get("priceFrom");
					String priceTo = (String) searchconditionMap.get("priceTo");
					String ramFrom = (String) searchconditionMap.get("ramFrom");
					String ramTo = (String) searchconditionMap.get("ramTo");
 					@SuppressWarnings("unchecked")
					List<String> brandIds = (List<String>) searchconditionMap.get("listBrandId");
					Join<ProductEntity, BrandEntity> brandRoot = productRoot.join("brandEntity");
					Join<ProductEntity, ProductOptionEntity> productInfoRoot = productRoot.join("productInfoEntity");
//					productInfoRoot.on(criteriaBuilder.equal(productRoot.get("productId"), productInfoRoot.get("productId")));
					// Search text predicate
					if(Strings.isNotEmpty(searchText)) {
						predicates.add(criteriaBuilder.or(
								       criteriaBuilder.like(productRoot.get("productName"), "%" + searchText + "%"),
								       criteriaBuilder.like(brandRoot.get("brandName"), "%" + searchText + "%")
								       ));
					}
					
					// Price from predicate
					if(Strings.isNotEmpty(priceFrom)) {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(productRoot.get("unitPrice"), Double.parseDouble(priceFrom)));
					}
					
					// Price to predicate
					if(Strings.isNotEmpty(priceTo)) {
						predicates.add(criteriaBuilder.lessThanOrEqualTo(productRoot.get("unitPrice"), Double.parseDouble(priceTo)));
					}
					
					// Ram to predicate
					if(Strings.isNotEmpty(ramFrom)) {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramFrom)));
					}
					
					// Ram to predicate
					if(Strings.isNotEmpty(ramTo)) {
						predicates.add(criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramTo)));
					}
					
					
					if(!CollectionUtils.isEmpty(brandIds)) {
						List<Predicate> listPredicateBrandId = new ArrayList<Predicate>();
						for(String brandId : brandIds) {
							listPredicateBrandId.add(criteriaBuilder.equal(brandRoot.get("brandId"), Integer.parseInt(brandId)));
						}
						predicates.add(criteriaBuilder.or(listPredicateBrandId.toArray(new Predicate[listPredicateBrandId.size()])));
					}
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
			
		};
	}
	
}
