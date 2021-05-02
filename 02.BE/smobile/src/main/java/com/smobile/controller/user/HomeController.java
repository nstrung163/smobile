package com.smobile.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smobile.service.IProductService;

@Controller
public class HomeController {

	@Autowired
	IProductService productService;
	
	@GetMapping(value = "/home")
	public String initHomePage(Model model) {
		model.addAttribute("totalProduct", productService.findAllProduct().size());
		return "index";
	}
	
	// Cần chỉnh sửa sau
	@GetMapping(value = "/user/search")
	public String initSearchPage() {
		return "user/product";
	} 
	
	@GetMapping(value = "/user/history-buy")
	public String initHistoryBuyPage() {
		return "user/history-buy";
	}
	
	@RequestMapping(value = "/user/cart", method = {RequestMethod.GET, RequestMethod.POST})
	public String initCartPage() {
		return "user/cart";
	}
	
	@GetMapping(value = "/user/register")
	public String initRegisterPage() {
		return "user/register";
	}
	
	@GetMapping(value = "/user/product")
	public String initProductPage() {
		return "user/product";
	}
	
	@GetMapping(value = "/user/news")
	public String initNewsPage() {
		return "user/news";
	}
	
	@GetMapping(value = "/user/contact-us")
	public String initContactUsPage() {
		return "user/contact-us";
	}
	
	@GetMapping(value = "/user/product-detail/{id}")
	public String findProductDetailPage(@PathVariable(value = "id") Integer id) {
		return "user/product-detail";
	}
	
}
