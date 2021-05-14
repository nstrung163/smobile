package com.smobile.service;

import java.util.List;

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.PurchaseModel;
import com.smobile.model.ResponseDataModel;

public interface ICartService {
	
	/**
	 * 
	 * Add product item to cart
	 * 
	 * @param productOptionId
	 * @return ResponseDataModel
	 */
	ResponseDataModel addProductItemToCart(Integer productOptionId);
	
	/**
	 * 
	 * Add product to cart by product option id
	 * 
	 * @param productOptionId
	 * @return CartModel
	 */
	CartModel addProductToCart(Integer productOptionId);

	/**
	 * 
	 * Add product quantity in cart
	 * 
	 * @param productOptionId
	 * @return ResponseDataModel
	 */
	ResponseDataModel addProductQuantity(Integer productOptionId);
	
	/**
	 * 
	 * Get all purchase detail(cart item) in cart
	 * 
	 * @return List<PurchaseModel>
	 */
	List<PurchaseModel> getAllPurchaseDetail();
	
	/**
	 * 
	 * Get a list of purchase history by userId
	 * 
	 * @param userId
	 * @return List<PurchaseModel>
	 */
	List<PurchaseModel> getListHistoryBuy(Integer userId);
	
	/**
	 * 
	 * Get a list of purchase detail by purchaseDetailId
	 * 
	 * @param purchaseDetailId
	 * @return List<PurchaseModel>
	 */
	List<PurchaseModel> getPurchaseDetailById(Integer purchaseDetailId);
	
	/**
	 * 
	 * Checkout cart 
	 * 
	 * @param purchaseEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel checkoutCart(PurchaseEntity purchaseEntity);
	
	/**
	 * 
	 * Convert product to product item model
	 * 
	 * @param productId
	 * @return ProductItemModel
	 */
	ProductItemModel convertProductToProductItemModel(Integer productId);
}
