package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.ProductImageEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.ProductImageServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class ProductImageController {

	@Autowired
	ProductImageServiceImpl productImageService;
	
	@GetMapping(value = "/product-images")
	@ResponseBody
	public List<ProductImageEntity> getAllProductImage() {
		return productImageService.findAllProductImage();
	}
	
	@GetMapping(value = "/product-image/{id}")
	@ResponseBody
	public ProductImageEntity findProductImageById(@PathVariable(value = "id") Integer id) {
		return productImageService.findByProductImageId(id);
	}
	
	@PostMapping(value = "/product-image")
	@ResponseBody
	public ResponseDataModel addNewProductImage(@ModelAttribute ProductImageEntity productImageEntity) {
		return productImageService.addProductImage(productImageEntity);
	}
	
	@PutMapping(value = "/product-image")
	@ResponseBody
	public ResponseDataModel updateProductImage(@ModelAttribute ProductImageEntity productImageEntity) {
		return productImageService.updateProductImage(productImageEntity);
	}
	
	@DeleteMapping(value = "/product-image/{id}")
	@ResponseBody
	public ResponseDataModel deleteProductImage(@PathVariable(value = "id") Integer productImageId) {
		return productImageService.deleteProductImage(productImageId);
	}
	
}
