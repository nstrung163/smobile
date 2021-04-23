package com.smobile.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductMemoryPriceModel {

	private Integer product_id;
	
	private int memory_product;
	
	private double sale_price;
}
