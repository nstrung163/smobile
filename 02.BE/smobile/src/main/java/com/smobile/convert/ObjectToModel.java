package com.smobile.convert;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.smobile.model.ProductCommentModel;
import com.smobile.model.ProductMemoryPriceModel;
import com.smobile.model.ProductStatisticModel;
import com.smobile.model.PurchaseModel;

/**
 * The ObjectToModel to convert from Object to Model
 */
public class ObjectToModel {

	/**
	 * 
	 * Convert list array object to product memory and price model
	 * 
	 * @param arrObject
	 * @return List<ProductMemoryPriceModel>
	 */
	public static List<ProductMemoryPriceModel> convertToListProductMemoryPrice(List<Object[]> arrObject) {
		List<ProductMemoryPriceModel> productMemoryPriceList = new ArrayList<ProductMemoryPriceModel>();
		for (Object[] obj : arrObject) {
			BigInteger productIdBig = (BigInteger) obj[0];
			Integer productIdTemp = productIdBig.intValue();
			int memoryProduct = (Integer) obj[1];
			double salePrice = (Double) obj[2];
			ProductMemoryPriceModel priceModel = new ProductMemoryPriceModel(productIdTemp, memoryProduct, salePrice);
			productMemoryPriceList.add(priceModel);
		}
		return productMemoryPriceList;
	}

	/**
	 * 
	 * Convert list array object to product comment model 
	 * 
	 * @param arrObject
	 * @return List<ProductCommentModel>
	 */
	public static List<ProductCommentModel> convertToListProductCommentModel(List<Object[]> arrObject) {
		List<ProductCommentModel> productCommentModels = new ArrayList<ProductCommentModel>();
		for (Object[] obj : arrObject) {
			BigInteger productIdBig = (BigInteger) obj[0];
			Integer productId = productIdBig.intValue();
			String commentContent = (String) obj[1];
			Date dateOfComment = (Date) obj[2];
			String imageCommentUrl = (String) obj[3];
			int rateNumber = (Integer) obj[4];
			String fullName = (String) obj[5];
			String avatarUrl = (String) obj[6];
			ProductCommentModel productCommentModel = new ProductCommentModel(productId, commentContent, dateOfComment, imageCommentUrl, fullName, avatarUrl, rateNumber);;
			productCommentModels.add(productCommentModel);
		}
		return productCommentModels;
	}

	/**
	 * 
	 * Convert list array object to purchase model
	 * 
	 * @param arrObject
	 * @returnList<PurchaseModel>
	 */
	public static List<PurchaseModel> convertToListPurchaseModel(List<Object[]> arrObject) {
		List<PurchaseModel> purchaseModelList = new ArrayList<PurchaseModel>();
		for (Object[] obj : arrObject) {
			BigInteger purchaseDetailIdBig = (BigInteger) obj[0];
			Integer purchaseDetailId = purchaseDetailIdBig.intValue();
			String productName = (String) obj[1];
			String colorProductName = (String) obj[2];
			int memoryProduct = (int) obj[3];
			double salePrice = (double) obj[4];
			int quantity = (int) obj[5];
			Date dateOfOrder = (Date) obj[6];
			String purchaseStatusName = (String) obj[7];
			String fullName = (String) obj[8];
			String imageUrl = (String) obj[9];
			BigInteger purchaseIdBig = (BigInteger) obj[10];
			Integer purchaseId = purchaseIdBig.intValue();
			String phoneNumber = (String) obj[11];
			String deliveryAddress = (String) obj[12];
			BigInteger purchaseStatusIdBig = (BigInteger) obj[13];
			Integer purchaseStatusId = purchaseStatusIdBig.intValue();
			String notePurchase = (String) obj[14];
			PurchaseModel purchaseModel = new PurchaseModel(purchaseDetailId, productName, colorProductName,memoryProduct, 
											                salePrice, quantity, dateOfOrder, purchaseStatusName, 
											                fullName, imageUrl, purchaseId, phoneNumber, deliveryAddress, purchaseStatusId, notePurchase);
			purchaseModelList.add(purchaseModel);
		}
		return purchaseModelList;
	}
	
	/**
	 * 
	 * Convert list array object to product statistic model
	 * 
	 * @param arrObj
	 * @return
	 */
	public static List<ProductStatisticModel> convertToListProductStatistic(List<Object[]> arrObj) {
		List<ProductStatisticModel> productStatisticModels = new ArrayList<ProductStatisticModel>();
		for(Object[] obj : arrObj) {
			BigInteger productIdBig = (BigInteger) obj[0];
			Integer productId = productIdBig.intValue();
			String productName = (String) obj[1];
			Integer quantity = (Integer) obj[2];
			Date saleDate = (Date) obj[3];
			String statusProduct = (String) obj[4];
			BigDecimal numberOfProductsSoldBig = (BigDecimal) obj[7];
			Integer numberOfProductsSold = numberOfProductsSoldBig.intValue();
			ProductStatisticModel productStatisticModel = new ProductStatisticModel(productId, productName, quantity, saleDate, statusProduct, numberOfProductsSold);
			productStatisticModels.add(productStatisticModel);
		}
		return productStatisticModels;
	}

}
