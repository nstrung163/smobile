package com.smobile.controller.user;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping(value = "/user")
public class LoginController {

	@Autowired
	IUserService userService;
	
	@PostMapping(value = "/register")
	@ResponseBody
	public ResponseDataModel registerAccount(@ModelAttribute UserEntity userEntity) {
		return userService.addNewUser(userEntity);
	}
}
