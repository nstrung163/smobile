package com.smobile.model;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductMemoryPriceModel {

	private Integer productId;

	private int memoryProduct;

	private double salePrice;
	
}
