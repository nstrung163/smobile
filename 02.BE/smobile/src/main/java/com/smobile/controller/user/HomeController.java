package com.smobile.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.model.ResponseDataModel;
import com.smobile.service.IProductItemModelService;

@Controller
public class HomeController {
	
	@Autowired
	IProductItemModelService productItemService;
	
	@GetMapping(value = "/product-item")
	@ResponseBody
	public ResponseDataModel getAllProductItem() {
		return productItemService.findAllProductItem();
	}
	
	@GetMapping(value = "/product-outstanding")
	@ResponseBody
	public ResponseDataModel getListOutstading() {
		return productItemService.getProductOutstanding();
	}
	
}
