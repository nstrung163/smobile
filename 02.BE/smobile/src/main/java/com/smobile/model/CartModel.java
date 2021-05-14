package com.smobile.model;

import java.util.HashMap;
import java.util.Map;

import com.smobile.entity.ProductEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartModel {

	private Integer productOptionId;

	private ProductEntity productEntity;

	private int quantity;

	private double salePrice;

	private String productName;
	
	private String imageUrl;
	
	public static double getTotalPrice(HashMap<Integer, CartModel> cardItems) {
		double totalPrice = 0;
		for (Map.Entry<Integer, CartModel> cartItem : cardItems.entrySet()) {
			totalPrice += cartItem.getValue().getSalePrice() * cartItem.getValue().getQuantity();
		}
		return totalPrice;
	}
}
