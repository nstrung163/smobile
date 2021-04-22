package com.smobile.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestWeb {

	@GetMapping(value = "/home")
	public String initPageHome() {
		return "index";
	}
}
