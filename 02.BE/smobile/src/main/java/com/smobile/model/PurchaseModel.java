package com.smobile.model;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseModel {

	private Integer purchaseDetailId;
	
	private String productName;
	
	private String colorProductName;
	
	private int memoryProduct;
	
	private double salePrice;
	
	private int quantity;
	
	private Date dateOfOrder;
	
	private String purchaseStatusName;
	
	private String fullName;
	
	private String imageUrl;
	
	private Integer purchaseId;
	
	private String phoneNumber;
	
	private String deliveryAddress;
	
	private Integer purchaseStatusId;
	
}
