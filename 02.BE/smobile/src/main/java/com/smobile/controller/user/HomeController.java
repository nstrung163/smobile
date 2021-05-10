package com.smobile.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smobile.entity.UserEntity;
import com.smobile.model.PurchaseModel;
import com.smobile.model.RateCommentModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.IBrandService;
import com.smobile.service.IProductResponseService;
import com.smobile.service.IProductService;

@Controller
public class HomeController {

	@Autowired
	IProductService productService;
	
	@Autowired
	IProductResponseService productResponseService;
	
	@Autowired
	IBrandService brandService;
	
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
	public ModelAndView initHistoryBuyPage() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userEntity = authentication.getName();
		if(userEntity.toString().equals("anonymousUser")) {
			System.out.println("User anonymousUser");
		} else {
			UserEntity userEntityAuthendicatied = (UserEntity) authentication.getPrincipal();
			List<PurchaseModel> listHistoryBuy = productResponseService.getListHistoryBuy(userEntityAuthendicatied.getUserId());
			modelAndView.addObject("listHistoryBuy", listHistoryBuy);
		}
		modelAndView.setViewName("user/history-buy");
		return modelAndView;
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
	public String initProductPage(Model model) {
		model.addAttribute("listBrand", brandService.findAllBrand());
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
	
	@PostMapping(value = "/user/comment")
	@ResponseBody
	public ResponseDataModel addNewComment(@ModelAttribute RateCommentModel rateCommentModel) {
		return productResponseService.addNewRateAndComment(rateCommentModel);
	}
}
