package com.smobile.convert;

import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.smobile.model.ProductCommentModel;
import com.smobile.model.ProductMemoryPriceModel;
import com.smobile.model.PurchaseModel;

public class ObjectToModel {

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
			PurchaseModel purchaseModel = new PurchaseModel(purchaseDetailId, productName, colorProductName,memoryProduct, 
											                salePrice, quantity, dateOfOrder, purchaseStatusName, 
											                fullName, imageUrl, purchaseId, phoneNumber, deliveryAddress, purchaseStatusId);
			purchaseModelList.add(purchaseModel);
		}
		return purchaseModelList;
	}

}
