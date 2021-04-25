package com.smobile.convert;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.smobile.model.ProductCommentModel;
import com.smobile.model.ProductMemoryPriceModel;

public class ObjectToModel {

	public static List<ProductMemoryPriceModel> convertToListProductMemoryPrice(List<Object[]> arrObject) {
		List<ProductMemoryPriceModel> productMemoryPriceList = new ArrayList<ProductMemoryPriceModel>();
		for(Object[] obj : arrObject){
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
		for(Object[] obj : arrObject) {
			 String commentContent = (String) obj[0];
			 Date dateOfComment = (Date) obj[1];
			 String fullName = (String) obj[2];
			 String avatarUrl = (String) obj[3];
			 int rateNumber = (Integer) obj[4];
			 ProductCommentModel productCommentModel = new ProductCommentModel(commentContent, dateOfComment, fullName, avatarUrl, rateNumber);
			 productCommentModels.add(productCommentModel);
		}
		return productCommentModels;
	}
	
}
