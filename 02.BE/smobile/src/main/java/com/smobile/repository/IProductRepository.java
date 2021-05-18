package com.smobile.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.util.CollectionUtils;

import com.smobile.entity.BrandEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductInfoEntity;
import com.smobile.model.SearchCondition;

public interface IProductRepository extends JpaRepository<ProductEntity, Integer>,JpaSpecificationExecutor<ProductEntity> {

	Page<ProductEntity> findByProductNameContainingIgnoreCase(String productName, Pageable pageable);
	
	ProductEntity findByProductId(Integer productId);
	
	ProductEntity findByProductName(String productName);
	
	ProductEntity findByProductNameAndProductIdNot(String productName, Integer productId);
	
	@Query(value = "SELECT P.* FROM PRODUCT AS P WHERE P.PRODUCT_ID = ?1", nativeQuery = true)
	ProductEntity checkExistProduct(Integer producId);
	
	@Query(value = "SELECT P.* \r\n"
					+ "FROM PRODUCT AS P \r\n"
					+ "JOIN (SELECT PD.PRODUCT_ID, COUNT(PD.PRODUCT_ID) AS TOTAL_SALE\r\n"
					+ "		  FROM PURCHASE_DETAIL AS PD\r\n"
					+ "		  GROUP BY PD.PRODUCT_ID LIMIT 3) AS PD ON PD.PRODUCT_ID = P.PRODUCT_ID\r\n"
					+ "ORDER BY PD.TOTAL_SALE DESC", nativeQuery = true)
	List<ProductEntity> findProductOutstanding();
	
	// Query ten product to have discount highest
	@Query(value = "SELECT DISTINCT P.*\r\n"
					+ "FROM PRODUCT AS P JOIN PRODUCT_OPTION AS PO ON P.PRODUCT_ID = PO.PRODUCT_ID\r\n"
					+ "ORDER BY ( P.UNIT_PRICE - PO.SALE_PRICE) DESC LIMIT 10", nativeQuery = true)
	List<ProductEntity> getTenProductDiscountHighest();
	
	@Query(value = "SELECT P.* \r\n"
					+ "FROM PRODUCT AS P \r\n"
					+ "LEFT JOIN (SELECT PM.PRODUCT_ID, AVG(RATE_NUMBER) AS AVERAGE_RATE, COUNT(RATE_NUMBER) AS TOTAL_RATE\r\n"
					+ "			   FROM PRODUCT_COMMENT AS PM\r\n"
					+ "			   GROUP BY PM.PRODUCT_ID) AS PM ON P.PRODUCT_ID = PM.PRODUCT_ID\r\n"
					+ "ORDER BY PM.TOTAL_RATE DESC, PM.AVERAGE_RATE DESC LIMIT 10", nativeQuery = true)
	List<ProductEntity> findAllProductItem();
	
	@Query(value = "SELECT P.* FROM PRODUCT_OPTION AS PO JOIN PRODUCT AS P ON PO.PRODUCT_ID = P.PRODUCT_ID WHERE PO.PRODUCT_OPTION_ID = ?1", nativeQuery = true)
	ProductEntity findProductByProductOptionId(Integer productOptionId);
	
	@Query(value = "SELECT P.*\r\n"
					+ "FROM PRODUCT AS P\r\n"
					+ "	 LEFT JOIN (SELECT PM.PRODUCT_ID, AVG(RATE_NUMBER) AS AVERAGE_RATE, COUNT(RATE_NUMBER) AS TOTAL_RATE\r\n"
					+ "			  FROM PRODUCT_COMMENT AS PM\r\n"
					+ "			  GROUP BY PM.PRODUCT_ID) AS PM ON P.PRODUCT_ID = PM.PRODUCT_ID\r\n"
					+ "WHERE (P.UNIT_PRICE BETWEEN (SELECT UNIT_PRICE FROM PRODUCT WHERE PRODUCT_ID = ?1) - 3000000 \r\n"
					+ "						   AND (SELECT UNIT_PRICE FROM PRODUCT WHERE PRODUCT_ID = ?1) + 3000000) \r\n"
					+ "	  AND P.PRODUCT_ID NOT IN (SELECT PT.PRODUCT_ID  FROM PRODUCT AS PT WHERE PT.PRODUCT_ID = ?1)\r\n"
					+ "ORDER BY PM.TOTAL_RATE DESC, PM.AVERAGE_RATE DESC LIMIT 5", nativeQuery = true)
	List<ProductEntity> findProductRelatedByProductId(Integer productId);
	
//	@Query(value = "SELECT PRODUCT.*\r\n"
//			+ "			FROM PRODUCT\r\n"
//			+ "			LEFT JOIN (SELECT PRODUCT_ID, AVG(RATE_NUMBER) AS AVERAGE_RATE, COUNT(RATE_NUMBER) AS TOTAL_RATE\r\n"
//			+ "						   FROM PRODUCT_COMMENT \r\n"
//			+ "					   GROUP BY PRODUCT_ID) AS PM ON PRODUCT.PRODUCT_ID = PM.PRODUCT_ID", nativeQuery = true)
//	Page<ProductEntity> findAllOutStanding(Pageable pageable);
	
	@Query(value = "SELECT P.*, IFNULL(PCD.NUMBER_OF_PRODUCTS_SOLD, 0) AS NUMBER_OF_PRODUCTS_SOLD\r\n"
			+ "FROM PRODUCT AS P \r\n"
			+ "	 	LEFT JOIN (SELECT PCD.PRODUCT_ID, SUM(PCD.QUANTITY) AS NUMBER_OF_PRODUCTS_SOLD\r\n"
			+ "				FROM PURCHASE_DETAIL AS PCD\r\n"
			+ "				JOIN (SELECT PURCHASE_ID FROM PURCHASE WHERE PURCHASE_STATUS_ID = 3) AS PC ON PC.PURCHASE_ID = PCD.PURCHASE_ID\r\n"
			+ "				GROUP BY PCD.PRODUCT_ID) AS PCD ON P.PRODUCT_ID = PCD.PRODUCT_ID\r\n"
			+ "ORDER BY NUMBER_OF_PRODUCTS_SOLD DESC;", nativeQuery = true)
	List<Object[]> getListProductStatistic();
	
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
					List<String[]> listPin = searchCondition.getListPin();
					
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
							
							if(StringUtils.isNotEmpty(ramFrom) && StringUtils.isNotEmpty(ramTo)) {
								listPredicateRam.add(criteriaBuilder.and(
													 criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramFrom)),
													 criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramTo))
													 ));
							} else if(Strings.isNotEmpty(ramFrom)) {
								listPredicateRam.add(criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramFrom)));
							} else if(Strings.isNotEmpty(ramTo)) {
								listPredicateRam.add(criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("ram"), Integer.parseInt(ramTo)));
							}
						}
						predicates.add(criteriaBuilder.or(listPredicateRam.toArray(new Predicate[listPredicateRam.size()])));
					}
					
					// Battery capacity predicate
					if(!CollectionUtils.isEmpty(listPin)) {
						List<Predicate> listPredicatePin = new ArrayList<Predicate>(); 
						for(String pin[]: listPin) {
							String pinFrom = pin[0];
							String pinTo = pin[1];
							
							if(StringUtils.isNotEmpty(pinFrom) && StringUtils.isNotEmpty(pinTo)) {
								listPredicatePin.add(criteriaBuilder.and(
													 criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("numberOfBatteryCapacity"), Integer.parseInt(pinFrom)),
													 criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("numberOfBatteryCapacity"), Integer.parseInt(pinTo))
													 ));
							} else if(StringUtils.isNotEmpty(pinFrom)) { 
								listPredicatePin.add(criteriaBuilder.greaterThanOrEqualTo(productInfoRoot.get("numberOfBatteryCapacity"), Integer.parseInt(pinFrom)));
							} else if(StringUtils.isNotEmpty(pinTo)) {
								listPredicatePin.add(criteriaBuilder.lessThanOrEqualTo(productInfoRoot.get("numberOfBatteryCapacity"), Integer.parseInt(pinTo)));
							}
						}
						predicates.add(criteriaBuilder.or(listPredicatePin.toArray(new Predicate[listPredicatePin.size()])));
					}
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
}
