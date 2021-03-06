package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.ProductOptionServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class ProductOptionController {

	@Autowired
	ProductOptionServiceImpl productOptionService;
	
	@GetMapping(value = "/product-options")
	@ResponseBody
	public List<ProductOptionEntity> getAllProductOption() {
		return productOptionService.findAllProductOption();
	}
	
	@GetMapping(value = "/product-option/{id}")
	@ResponseBody
	public ProductOptionEntity findByProductOptionId(@PathVariable(value = "id") Integer id) {
		return productOptionService.findByProductOption(id);
	}
	
	@PostMapping(value = "/product-option")
	@ResponseBody
	public ResponseDataModel addNewProuctOption(@RequestBody ProductOptionEntity productOptionEntity) {
		return productOptionService.addNewProductOption(productOptionEntity);
	}
	
	@PutMapping(value = "/product-option")
	@ResponseBody
	public ResponseDataModel updateProductOption(@RequestBody ProductOptionEntity productOptionEntity) {
		return productOptionService.updateProductOption(productOptionEntity);
	}
	
	@DeleteMapping(value = "/product-option/{id}")
	@ResponseBody
	public ResponseDataModel deleteProductOption(@PathVariable(value = "id") Integer id) {
		return productOptionService.deleteProductOption(id);
	}
}
