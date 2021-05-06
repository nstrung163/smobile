package com.smobile.controller.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.model.ResponseDataModel;
import com.smobile.service.IProductResponseService;
import com.smobile.service.IProductService;

@Controller
@RequestMapping(value = "/user")
public class ProductControllerUser {
	
	@Autowired
	IProductResponseService productResponseService;
	
	@Autowired
	IProductService productService;
	
	@GetMapping(value = "/product-items")
	@ResponseBody
	public ResponseDataModel getAllProductItem() {
		return productResponseService.findAllProductItem();
	}
	
	@GetMapping(value = "/api/product-items/{pageNumber}")
	@ResponseBody
	public ResponseDataModel getAllProductItemApi(@PathVariable(value = "pageNumber") int pageNumber) {
		return productResponseService.findAllProcuctApi(pageNumber);
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
	
	@GetMapping(value = "/api/product/{pageNumber}")
	@ResponseBody
	public ResponseDataModel findAllPageWithApi(@PathVariable(value = "pageNumber") int pageNumber) {
		return productResponseService.findAllProcuctApi(pageNumber);
	}
	
	@PostMapping(value = "/api/search-product/{pageNumber}")
	@ResponseBody
	public ResponseDataModel searchProduct(@RequestBody Map<String, Object> searchConditionMap,
											@PathVariable(value = "pageNumber") int pageNumber) {
		return productResponseService.getSearchCondition(searchConditionMap, pageNumber);
	}
	
}
