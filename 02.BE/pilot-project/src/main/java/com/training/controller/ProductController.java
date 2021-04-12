package com.training.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.training.entity.ProductEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;
import com.training.service.IProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	IProductService productService;

	@Autowired
	IBrandService brandService;

	/**
	 * Initialization page
	 *  
	 * @param model
	 * 
	 */
	@GetMapping
	public String initProductPage(Model model) {
		model.addAttribute("listBrand", brandService.getAll());
		return "product-index";
	}

	/**
	 * Find all product with pager
	 * 
	 * @param pageNumber
	 * 
	 */
	@GetMapping("/api/findAll/{pageNumber}")
	@ResponseBody
	public ResponseDataModel findAllProductWithPage(@PathVariable("pageNumber") int pageNumber) {
		return productService.findAllProductWithPage(pageNumber);
	}

	/**
	 * Add new product
	 * 
	 * @param productEntity
	 * 
	 */
	@PostMapping(value = "/api/add")
	@ResponseBody
	public ResponseDataModel addProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.addProduct(productEntity);
	}

	/**
	 * Find product by id
	 * 
	 * @param productId
	 * 
	 */
	@GetMapping("/api/find")
	@ResponseBody
	public ResponseDataModel findProductById(@RequestParam("id") Long productId) {
		return productService.findProductById(productId);
	}

	/**
	 * 	Edit product
	 * 
	 * @param productEntity
	 * 
	 */
	@PostMapping(value = { "/api/update" })
	@ResponseBody
	public ResponseDataModel updateProduct(@ModelAttribute ProductEntity productEntity) {
		return productService.updateProduct(productEntity);
	}

	/**
	 * Delete product
	 *  
	 * @param productId
	 * 
	 */
	@DeleteMapping(value = {"/api/delete/{productId}"})
	@ResponseBody
	public ResponseDataModel deleteProduct(@PathVariable("productId") Long productId) {
		return productService.deleteProduct(productId);
	}
	
	/**
	 * Search product by product name or brand name and price
	 * 
	 * @param searchConditions
	 * @param pageNumber
	 * 
	 */
	@PostMapping(value = {"/api/searchProduct/{pageNumber}"})
	@ResponseBody
	public ResponseDataModel searchProduct(@RequestBody Map<String, Object> searchConditions, 
			@PathVariable("pageNumber") int pageNumber) {
		return productService.searchProductWithConditions(searchConditions, pageNumber);
	}
}
