package com.smobile.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeAdminController {

	@GetMapping(value = { "", "/admin/home", "/admin" })
	public String initHomePage() {
		return "admin/index-admin";
	}

	@GetMapping(value = "/brand-list")
	public String initBrandPage() {
		return "admin/brand-admin";
	}
	
	@GetMapping(value = "/product-list")
	public String initProductPage() {
		return "admin/product-admin";
	}
}
