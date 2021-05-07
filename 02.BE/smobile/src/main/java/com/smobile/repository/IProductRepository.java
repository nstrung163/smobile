package com.smobile.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
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
import com.smobile.entity.ProductInfoEntity;
import com.smobile.model.SearchCondition;

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
	
	public static Specification<ProductEntity> getSearchCondition(SearchCondition searchCondition) {
		return new Specification<ProductEntity>() {
			
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<ProductEntity> productRoot, CriteriaQuery<?> query,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				if( searchCondition != null) {
					String searchText = searchCondition.getKeyword();
					String priceFrom = searchCondition.getPriceFrom();
					String priceTo = searchCondition.getPriceTo();
					
					List<String> brandIds = searchCondition.getListBrandId();
					List<String> listTypeProduct = searchCondition.getListTypeProduct();
					List<String[]> listRam = searchCondition.getListRam();
					List<String> listPin = searchCondition.getListPin();
					
					Join<ProductEntity, BrandEntity> brandRoot = productRoot.join("brandEntity");
					Join<ProductEntity, ProductInfoEntity> productInfoRoot = productRoot.join("productInfoEntity", JoinType.LEFT);
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
					
					// Brand of product 
					if(!CollectionUtils.isEmpty(brandIds)) {
						List<Predicate> listPredicateBrandId = new ArrayList<Predicate>();
						for(String brandId : brandIds) {
							listPredicateBrandId.add(criteriaBuilder.equal(brandRoot.get("brandId"), Integer.parseInt(brandId)));
						}
						predicates.add(criteriaBuilder.or(listPredicateBrandId.toArray(new Predicate[listPredicateBrandId.size()])));
					}
					
					// Type of product condition
					if(!CollectionUtils.isEmpty(listTypeProduct)) {
						List<Predicate> listPredicateTypeProduct = new ArrayList<Predicate>();
						for(String typeProduct : listTypeProduct) {
							listPredicateTypeProduct.add(criteriaBuilder.equal(productInfoRoot.get("typeProduct"), typeProduct));
						}
						predicates.add(criteriaBuilder.or(listPredicateTypeProduct.toArray(new Predicate[listPredicateTypeProduct.size()])));
					}
					
					// Ram condition
					if(!CollectionUtils.isEmpty(listRam)) {
						List<Predicate> listPredicateRam = new ArrayList<Predicate>();
						for(String[] ram: listRam) {
							String ramFrom = ram[0];
							String ramTo = ram[1];
							
							// Ram from predicate
							if(Strings.isNotEmpty(ramFrom)) {
								listPredicateRam.add(criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramFrom)));
							}
							
							// Ram to predicate
							if(Strings.isNotEmpty(ramTo)) {
								listPredicateRam.add(criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramTo)));
							}
						}
						predicates.add(criteriaBuilder.or(listPredicateRam.toArray(new Predicate[listPredicateRam.size()])));
					}
					
					// Battery capacity predicate
					if(!CollectionUtils.isEmpty(listPin)) {
						List<Predicate> listPredicatePin = new ArrayList<Predicate>();
						for(String pin: listPin) {
							listPredicatePin.add(criteriaBuilder.like(productInfoRoot.get("batteryCapacity"), "%" + pin + "%"));
						}
						predicates.add(criteriaBuilder.or(listPredicatePin.toArray(new Predicate[listPredicatePin.size()])));
					}
					
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
			
		};
	}
	
}
