package com.training.service;

import com.training.entity.UserEntity;


public interface IUserService {
	
	/**
	 * Find user by user name
	 * 
	 * @param userName
	 * 
	 */
	UserEntity findByUsername(String username);

	/**
	 * User login
	 * 
	 * @param username
	 * @param password
	 * 
	 */
	UserEntity login(String username, String password);
	
}
