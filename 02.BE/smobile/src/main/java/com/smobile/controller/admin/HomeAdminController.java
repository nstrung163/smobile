package com.smobile.controller.admin;

import java.time.Year;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smobile.model.IPurchaseQuantity;
import com.smobile.model.IRevenuePrice;
import com.smobile.service.IBrandService;
import com.smobile.service.IProductService;
import com.smobile.service.IPurchaseService;
import com.smobile.service.IPurchaseStatusService;

@Controller
@RequestMapping(value = "/admin")
public class HomeAdminController {

	@Autowired
	IBrandService brandService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IPurchaseStatusService purchaseStatusService;
	
	@Autowired
	IPurchaseService purchaseService;
	
	@GetMapping(value = {"/home", "" })
	public String initialHomePage() {
		return "admin/index-admin";
	}

	@GetMapping(value = "/brand-list")
	public String initialBrandPage() {
		return "admin/brand-admin";
	}
	
	@GetMapping(value = "/product-list")
	public String initialProductPage(Model model) {
		model.addAttribute("brandList", brandService.findAllBrand());
		return "admin/product-admin";
	}
	
	@GetMapping(value = "/product-image-list")
	public String initialProductImagePage(Model model) {
		model.addAttribute("productList", productService.findAllProduct());
		return "admin/product-image-admin";
	}
	
	@GetMapping(value = "/product-option-list")
	public String initialProductOptionPage(Model model) {
		model.addAttribute("productList", productService.findAllProduct());
		return "admin/product-option-admin";
	}
	
	@GetMapping(value = "/product-info-list")
	public String initialInfoProductPage(Model model) {
		model.addAttribute("productList", productService.findAllProduct());
		return "admin/product-info-admin";
	}
	
	@GetMapping(value = "/user-list")
	public String initialUserPage(Model model) {
		return "admin/user-admin";
	}
	
	@GetMapping(value = "/comment-list")
	public String initialCommentPage(Model model) {
		return "admin/comment-admin";
	}
	
	@GetMapping(value = "/news-list")
	public String initialNewsPage(Model model) {
		return "admin/news-admin";
	}
	
	@GetMapping(value = "/purchase-list")
	public String initialPurchasePage(Model model) {
		return "admin/purchase-admin";
	}
	
	@GetMapping(value = "/purchase-detail-list")
	public String initialPurchaseDetailPage(Model model) {
		model.addAttribute("purchaseStatusList", purchaseStatusService.findAllPurchaseStatus());
		return "admin/purchase-detail-admin";
	}
	
	@GetMapping(value = "/statistic/product")
	public String initialStatisticProductPage(Model model) {
		return "admin/statistic-product";
	}
	
	@GetMapping(value = "/statistic/purchase")
	public String initialStatisticPurchasePage(@RequestParam(required = false) Integer year, Model model) {
		List<IPurchaseQuantity> purchaseQuantities;
		List<IRevenuePrice> revenuePrices;
		if(year != null) {
			model.addAttribute("titlePurchaseQuantity", "Thống Kê Số Lượng Đơn Hàng Trong Năm " + year);
			model.addAttribute("titleRevenuePrice", "Thống Kê Số Lượng Đơn Hàng Trong Năm " + year);
			purchaseQuantities = purchaseService.getListPurchaseQuantityEachMonth(year);
			revenuePrices = purchaseService.getListRevenueEachMonth(year);
		} else {
			int currentYeat = Year.now().getValue();
			model.addAttribute("titlePurchaseQuantity", "Thống Kê Số Lượng Đơn Hàng Trong Năm " + currentYeat);
			model.addAttribute("titleRevenuePrice", "Thống Kê Số Lượng Đơn Hàng Trong Năm " + currentYeat);
			purchaseQuantities = purchaseService.getListPurchaseQuantityEachMonth(currentYeat);
			revenuePrices = purchaseService.getListRevenueEachMonth(currentYeat);
		}
		
		List<Integer> listPurchaseQuantity = new ArrayList<Integer>();
		List<Double> listRevenPrice = new ArrayList<Double>();
		Integer biggestmaxPurchaseQuantity = 0;
		Double biggestRevenuePrice = 0.0;
		
		for(IPurchaseQuantity purchaseQuantity : purchaseQuantities) {
			listPurchaseQuantity.add(purchaseQuantity.getPurchaseQuantity());
			if(purchaseQuantity.getPurchaseQuantity() != null) {
				biggestmaxPurchaseQuantity = biggestmaxPurchaseQuantity > purchaseQuantity.getPurchaseQuantity() ? biggestmaxPurchaseQuantity : purchaseQuantity.getPurchaseQuantity(); 
			}
		}
		
		for(IRevenuePrice revenuePrice : revenuePrices) {
			listRevenPrice.add(revenuePrice.getRevenuePrice());
			if(revenuePrice.getRevenuePrice() != null) {
				biggestRevenuePrice = biggestRevenuePrice >  revenuePrice.getRevenuePrice() ? biggestRevenuePrice : revenuePrice.getRevenuePrice();
			}
		}
		
		model.addAttribute("biggestmaxPurchaseQuantity", biggestmaxPurchaseQuantity);
		model.addAttribute("biggestRevenuePrice", biggestRevenuePrice);
		model.addAttribute("listPurchaseQuantity", listPurchaseQuantity);
		model.addAttribute("listRevenPrice", listRevenPrice);
		
		return "admin/statistic-purchase";
	}
	
}
