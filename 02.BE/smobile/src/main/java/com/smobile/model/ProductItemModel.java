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
	
	private String imageItem;

	public void setTotalRate(int totalRate) {
		if(totalRate != 0) {
			this.totalRate = totalRate;
		} else {
			this.totalRate = 0;
		}
	}

	public void setAverageRate(float averageRate) {
		if(averageRate != 0) {
			this.averageRate = averageRate;
		} else {
			this.averageRate = 0;
		}
	}
	
	
	
}
