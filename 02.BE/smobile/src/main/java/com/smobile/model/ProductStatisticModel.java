package com.smobile.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductStatisticModel {

	private Integer productId;
	
	private String productName;
	
	private Integer quantity;
	
	private Date saleDate;
	
	private String statusProduct;
	
	private Integer numberOfProductsSold;
}
