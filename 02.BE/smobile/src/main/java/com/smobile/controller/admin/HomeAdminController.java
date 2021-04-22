package com.smobile.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smobile.service.IBrandService;
import com.smobile.service.IProductService;

@Controller
public class HomeAdminController {

	@Autowired
	IBrandService brandService;
	
	@Autowired
	IProductService productService;
	
	@GetMapping(value = {"/admin/home", "/admin" })
	public String initHomePage() {
		return "admin/index-admin";
	}

	@GetMapping(value = "/brand-list")
	public String initBrandPage() {
		return "admin/brand-admin";
	}
	
	@GetMapping(value = "/product-list")
	public String initProductPage(Model model) {
		model.addAttribute("brandList", brandService.findAllBrand());
		return "admin/product-admin";
	}
	
	@GetMapping(value = "/product-image-list")
	public String initProductImagePage(Model model) {
		model.addAttribute("productImageList", productService.findAllProduct());
		return "admin/product-image";
	}
}
