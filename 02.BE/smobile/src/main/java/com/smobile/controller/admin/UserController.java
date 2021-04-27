package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	UserServiceImpl userService;
	
	@GetMapping(value = "/users")
	@ResponseBody
	public List<UserEntity> getAllUser() {
		return userService.findAllUser();
	}
	
	@GetMapping(value = "/user/{id}")
	@ResponseBody
	public UserEntity findUserById(@PathVariable(value = "id") Integer id) {
		return userService.findByUserId(id);
	}
	
	@PostMapping(value = "/user")
	@ResponseBody
	public ResponseDataModel addNewUser(@ModelAttribute UserEntity userEntity) {
		return userService.addNewUser(userEntity);
	}
	
	@PutMapping(value = "/user")
	@ResponseBody
	public ResponseDataModel updateUser(@ModelAttribute UserEntity userEntity) {
		return userService.updateUser(userEntity);
	}
	
	@DeleteMapping(value = "/user/{id}")
	@ResponseBody
	public ResponseDataModel deleteUser(@PathVariable(value = "id") Integer id) {
		return userService.deleteUserById(id);
	}
}
