package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smobile.entity.BrandEntity;
import com.smobile.service.IBrandService;

@Controller
public class HomeAdminController {

	@Autowired
	IBrandService brandService;
	
	
	@GetMapping(value = { "", "/admin/home", "/admin" })
	public String initHomePage() {
		return "admin/index-admin";
	}

	@GetMapping(value = "/brand-list")
	public String initBrandPage() {
		return "admin/brand-admin";
	}
	
	@GetMapping(value = "/product-list")
	public String initProductPage(Model model) {
		List<BrandEntity> brandList = brandService.findAllBrand();
		model.addAttribute("brandList", brandList);
		return "admin/product-admin";
	}
}
