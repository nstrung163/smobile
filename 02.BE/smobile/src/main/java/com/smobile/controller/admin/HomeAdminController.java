package com.smobile.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smobile.service.IBrandService;
import com.smobile.service.IProductService;

@Controller
@RequestMapping(value = "/admin")
public class HomeAdminController {

	@Autowired
	IBrandService brandService;
	
	@Autowired
	IProductService productService;
	
	@GetMapping(value = {"/home", "" })
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
		return "admin/product-image-admin";
	}
	
	@GetMapping(value = "/product-option-list")
	public String initProductOptionPage(Model model) {
		return "admin/product-option-admin";
	}
	
	@GetMapping(value = "/product-info-list")
	public String initInfoProductPage(Model model) {
		return "admin/product-info-admin";
	}
	
	@GetMapping(value = "/user-list")
	public String initUserPage(Model model) {
		return "admin/user-admin";
	}
	
	@GetMapping(value = "/comment-list")
	public String initCommentPage(Model model) {
		return "admin/comment-admin";
	}
	
	@GetMapping(value = "/rate-list")
	public String initRatePage(Model model) {
		return "admin/rate-admin";
	}
	
	@GetMapping(value = "/news-list")
	public String initNewsPage(Model model) {
		return "admin/news-admin";
	}
	
	@GetMapping(value = "/purchase-list")
	public String initPurchasePage(Model model) {
		return "admin/purchase-admin";
	}
	
	@GetMapping(value = "/purchase-detail-list")
	public String initPurchaseDetailPage(Model model) {
		return "admin/purchase-detail-admin";
	}
	
	@GetMapping(value = "/statistic/product")
	public String initStatisticProductPage(Model model) {
		return "admin/statistic-product";
	}
	
	@GetMapping(value = "/statistic/purchase")
	public String initStatisticPurchasePage(Model model) {
		return "admin/statistic-purchase";
	}
	
}
