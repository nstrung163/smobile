package com.smobile.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.model.ResponseDataModel;
import com.smobile.service.IProductResponseService;

@Controller
@RequestMapping(value = "/user")
public class ProductControllerUser {
	
	@Autowired
	IProductResponseService productResponseService;
	
	@GetMapping(value = "/product-items")
	@ResponseBody
	public ResponseDataModel getAllProductItem() {
		return productResponseService.findAllProductItem();
	}
	
	@GetMapping(value = "/product-outstanding")
	@ResponseBody
	public ResponseDataModel getListOutstanding() {
		return productResponseService.getProductOutstanding();
	}
	
	@GetMapping(value = "/product-detail/{id}/api")
	@ResponseBody
	public ResponseDataModel findProductDetailById(@PathVariable(value = "id") Integer id) {
		return productResponseService.findProductDetailById(id);
	}
	
	@GetMapping(value = "/product-option/{memory}/{productId}")
	@ResponseBody
	public ResponseDataModel getListProductOptionByMemoryAndProductId(@PathVariable(value = "memory") int memory, @PathVariable(value = "productId") Integer productId) {
		return productResponseService.getListProductOptionByMemoryAndProductId(memory, productId);
	}
	
}
