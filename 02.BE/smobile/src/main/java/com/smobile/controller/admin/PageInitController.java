package com.smobile.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageInitController {

	@GetMapping(value = "/login")
	public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error) {
		ModelAndView modelAndView = new ModelAndView();
		if (error != null) {
			modelAndView.addObject("errorMessage", "Mật khẩu hoặc tên tài khoản không chính xác!");
		}
		modelAndView.setViewName("login");
		return modelAndView;
	}

}
