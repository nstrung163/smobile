package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smobile.entity.PurchaseEntity;

public interface IPurchaseRepository extends JpaRepository<PurchaseEntity, Integer> {

	PurchaseEntity findByPurchaseId(Integer purchasetId);
	
	@Query(value = "SELECT P.* FROM PURCHASE AS P WHERE P.PURCHASE_ID = (SELECT MAX(PURCHASE_ID) FROM PURCHASE)", nativeQuery = true)
	PurchaseEntity findPurchaseJustCreated();
	
	@Query(value = "SELECT \r\n"
			+ "		PCD.PURCHASE_DETAIL_ID, P.PRODUCT_NAME, \r\n"
			+ "		PO.COLOR_PRODUCT_NAME, PO.MEMORY_PRODUCT, PCD.SALE_PRICE, PCD.QUANTITY, PC.DATE_OF_ORDER,\r\n"
			+ "		PCS.PURCHASE_STATUS_NAME, U.FULL_NAME, PO.IMAGE_URL, PC.PURCHASE_ID \r\n"
			+ "	FROM PURCHASE_DETAIL AS PCD \r\n"
			+ "		JOIN PRODUCT AS P ON PCD.PRODUCT_ID = P.PRODUCT_ID\r\n"
			+ "		JOIN PRODUCT_OPTION AS PO ON PCD.PRODUCT_OPTION_ID = PO.PRODUCT_OPTION_ID\r\n"
			+ "		JOIN PURCHASE AS PC ON PCD.PURCHASE_ID = PC.PURCHASE_ID\r\n"
			+ "		JOIN USER AS U ON PC.USER_ID = U.USER_ID\r\n"
			+ "		JOIN PURCHASE_STATUS AS PCS ON PC.PURCHASE_STATUS_ID = PCS.PURCHASE_STATUS_ID\r\n"
			+ "	WHERE U.USER_ID = ?1"
			+ "	ORDER BY PCD.PURCHASE_DETAIL_ID DESC", nativeQuery = true)
	List<Object[]> getListPurchaseDetailByUserId(Integer userId);
	
	@Query(value = "SELECT \r\n"
			+ "		PCD.PURCHASE_DETAIL_ID, P.PRODUCT_NAME, \r\n"
			+ "		PO.COLOR_PRODUCT_NAME, PO.MEMORY_PRODUCT, PCD.SALE_PRICE, PCD.QUANTITY, PC.DATE_OF_ORDER,\r\n"
			+ "		PCS.PURCHASE_STATUS_NAME, U.FULL_NAME, PO.IMAGE_URL, PC.PURCHASE_ID \r\n"
			+ "	FROM PURCHASE_DETAIL AS PCD \r\n"
			+ "		JOIN PRODUCT AS P ON PCD.PRODUCT_ID = P.PRODUCT_ID\r\n"
			+ "		JOIN PRODUCT_OPTION AS PO ON PCD.PRODUCT_OPTION_ID = PO.PRODUCT_OPTION_ID\r\n"
			+ "		JOIN PURCHASE AS PC ON PCD.PURCHASE_ID = PC.PURCHASE_ID\r\n"
			+ "		JOIN USER AS U ON PC.USER_ID = U.USER_ID\r\n"
			+ "		JOIN PURCHASE_STATUS AS PCS ON PC.PURCHASE_STATUS_ID = PCS.PURCHASE_STATUS_ID\r\n"
			+ "	ORDER BY PCD.PURCHASE_DETAIL_ID DESC", nativeQuery = true)
	List<Object[]> getAllPurchaseDetail();
	
	@Query(value = "SELECT \r\n"
			+ "		PCD.PURCHASE_DETAIL_ID, P.PRODUCT_NAME, \r\n"
			+ "		PO.COLOR_PRODUCT_NAME, PO.MEMORY_PRODUCT, PCD.SALE_PRICE, PCD.QUANTITY, PC.DATE_OF_ORDER,\r\n"
			+ "		PCS.PURCHASE_STATUS_NAME, U.FULL_NAME, PO.IMAGE_URL, PC.PURCHASE_ID \r\n"
			+ "	FROM PURCHASE_DETAIL AS PCD \r\n"
			+ "		JOIN PRODUCT AS P ON PCD.PRODUCT_ID = P.PRODUCT_ID\r\n"
			+ "		JOIN PRODUCT_OPTION AS PO ON PCD.PRODUCT_OPTION_ID = PO.PRODUCT_OPTION_ID\r\n"
			+ "		JOIN PURCHASE AS PC ON PCD.PURCHASE_ID = PC.PURCHASE_ID\r\n"
			+ "		JOIN USER AS U ON PC.USER_ID = U.USER_ID\r\n"
			+ "		JOIN PURCHASE_STATUS AS PCS ON PC.PURCHASE_STATUS_ID = PCS.PURCHASE_STATUS_ID\r\n"
			+ "	WHERE PCD.PURCHASE_DETAIL_ID = ?1", nativeQuery = true)
	List<Object[]> findPurchaseDetailById(Integer purchaseDetailId);
}
