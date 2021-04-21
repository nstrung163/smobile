package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.ProductEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.ProductServiceImpl;

@Controller
public class ProductController {

	@Autowired
	ProductServiceImpl productService;
	
	@GetMapping(value = "/products")
	@ResponseBody
	public List<ProductEntity> getAllProduct() {
		return productService.findAllProduct();
	}
	
	@GetMapping(value = "/product/{id}")
	@ResponseBody
	public ProductEntity findByProductId(@PathVariable(value = "id") Integer id) {
		return productService.findByProductId(id);
	}
	
	@PostMapping(value = "/product/add")
	@ResponseBody
	public ResponseDataModel addNewProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.addNewProduct(productEntity);
	}
	
	@RequestMapping(value = "/product/update", method = {RequestMethod.POST, RequestMethod.PUT})
	@ResponseBody
	public ResponseDataModel updateProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.updateProduct(productEntity);
	}
	
	@DeleteMapping(value = "/product/{id}")
	@ResponseBody
	public ResponseDataModel deleteProductById(@PathVariable(value = "id") Integer id) {
		return productService.deleteProductById(id);
	}
	
}
