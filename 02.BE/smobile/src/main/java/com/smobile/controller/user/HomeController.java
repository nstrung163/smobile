package com.smobile.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	
	@GetMapping(value = "/product")
	public String initProductPage() {
		return "product";
	}
	
	@GetMapping(value = "/product-detail/{id}")
	public String findProductDetailPage(@PathVariable(value = "id") Integer id) {
		return "product-detail";
	}
	
}
