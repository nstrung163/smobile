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

import com.smobile.entity.ProductInfoEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.ProductInfoServiceImpl;

@Controller
@RequestMapping(value = "/admin")
public class ProductInfoController {

	@Autowired
	ProductInfoServiceImpl productInfoService;
	
	@GetMapping("/list-product-info")
	@ResponseBody
	public List<ProductInfoEntity> getAllProductInfo(){
		return productInfoService.findAllProductInfo();
	}
	
	@GetMapping("/product-info/{id}")
	@ResponseBody
	public ProductInfoEntity findProducInfoById(@PathVariable(value = "id") Integer id) {
		return productInfoService.findByProductInfoId(id);
	}
	
	@PostMapping("/product-info")
	@ResponseBody
	public ResponseDataModel addNewProductInfo(@RequestBody ProductInfoEntity productInfoEntity) {
		return productInfoService.addNewProductInfo(productInfoEntity);
	}
	
	@PutMapping("/product-info")
	@ResponseBody
	public ResponseDataModel updateProductInfo(@RequestBody ProductInfoEntity productInfoEntity) {
		return productInfoService.updateProductInfo(productInfoEntity);
	}
	
	@DeleteMapping("/product-info/{id}")
	@ResponseBody
	public ResponseDataModel deleteProdcutInfoById(@PathVariable(value = "id") Integer id) {
		return productInfoService.deleteProdutInfo(id);
	}
}
