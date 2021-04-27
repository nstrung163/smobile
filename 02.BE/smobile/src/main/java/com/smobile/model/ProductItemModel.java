package com.smobile.model;

import com.smobile.entity.ProductEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductItemModel {

	private ProductEntity productEntity;
	
	private int totalRate;
	
	private float averageRate;
	
	private double salePrice;
	
	private String imageItem;
}
