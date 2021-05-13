package com.smobile.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.IProductResponseService;

@Controller
@RequestMapping(value = "/user")
public class CartController {

	@Autowired
	IProductResponseService productResponseService;

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/add-product/{productOptionId}")
	@ResponseBody
	public void addProductToCart(@PathVariable(value = "productOptionId") Integer productOptionId,
			HttpSession session) {
		HashMap<Integer, CartModel> cartItems = (HashMap<Integer, CartModel>) session.getAttribute("cartItems");
		CartModel cartModel = new CartModel();
		if (cartItems == null) {
			cartItems = new HashMap<Integer, CartModel>();
			cartModel = productResponseService.addProductToCart(productOptionId);
		} else {
			if (cartItems.containsKey(productOptionId)) { // check product exists
				cartModel = cartItems.get(productOptionId);
				cartModel.setQuantity(cartModel.getQuantity() + 1);
			} else {
				cartModel = productResponseService.addProductToCart(productOptionId);
			}
		}

		cartItems.put(productOptionId, cartModel);
		session.setAttribute("cartItems", cartItems);
		session.setAttribute("totalItem", cartItems.size());
		session.setAttribute("totalPrice", CartModel.getTotalPrice(cartItems));

		for (Map.Entry<Integer, CartModel> cartItem : cartItems.entrySet()) {
			System.out.println("Key: " + cartItem.getKey());
			System.out.println("Tên sản phẩm: " + cartItem.getValue().getProductName());
			System.out.println("Số lượng: " + cartItem.getValue().getQuantity());
			System.out.println("Đường dẫn ảnh: " + cartItem.getValue().getImageUrl());
			System.out.println("------------------------------------------");
		}

		System.out.println("Tổng số phẩn tử của cart: " + cartItems.size());
		System.out.println("Tổng giá của giỏ hàng: " + CartModel.getTotalPrice(cartItems));
		
	}
	
	@PostMapping(value = "/checkout")
	@ResponseBody
	public ResponseDataModel checkOutCart(@ModelAttribute PurchaseEntity purchaseEntity, HttpSession session) {
		return productResponseService.checkoutCart(purchaseEntity);
	}
	
	@PutMapping(value = "/cart/minus/{id}")
	@ResponseBody
	public void minusQuantityCart(@PathVariable(value = "id") Integer productOptionId, HttpSession session) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, CartModel> cartItems = (HashMap<Integer, CartModel>) session.getAttribute("cartItems");
		CartModel cartModel = new CartModel();
		if(cartItems.containsKey(productOptionId)) {
			cartModel = cartItems.get(productOptionId);
			cartModel.setQuantity(cartModel.getQuantity() - 1);
			if(cartModel.getQuantity() == 0) {
				cartItems.remove(productOptionId);
			} else {
				cartItems.put(productOptionId, cartModel);
			}
		}
		session.setAttribute("cartItems", cartItems);
		session.setAttribute("totalItem", cartItems.size());
		session.setAttribute("totalPrice", CartModel.getTotalPrice(cartItems));
	}
	
	@PutMapping(value = "/cart/plus/{id}")
	@ResponseBody
	public ResponseDataModel plusQuantityCart(@PathVariable(value = "id") Integer productOptionId) {
		return productResponseService.addProductQuantity(productOptionId);
	}
	
	@DeleteMapping(value = "/cart/remove/{id}")
	@ResponseBody
	public void removeQuantityCart(@PathVariable(value = "id") Integer productOptionId, HttpSession session) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, CartModel> cartItems = (HashMap<Integer, CartModel>) session.getAttribute("cartItems");
		if(cartItems.containsKey(productOptionId)) {
			cartItems.remove(productOptionId);
		}
		session.setAttribute("cartItems", cartItems);
		session.setAttribute("totalItem", cartItems.size());
		session.setAttribute("totalPrice", CartModel.getTotalPrice(cartItems));
	}

}
