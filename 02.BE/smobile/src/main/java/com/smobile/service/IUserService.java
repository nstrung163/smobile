package com.smobile.service;

import java.util.List;

import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;

public interface IUserService{

	/**
	 * Get all user
	 * 
	 * @return List<UserEntity>
	 */
	List<UserEntity> findAllUser();
	
	/**
	 * Find user by id
	 * 
	 * @param userId
	 * @return UserEntity
	 */
	UserEntity findByUserId(Integer userId);
	
	/**
	 * Find user by user name
	 * 
	 * @param userName
	 * @return UserEntity
	 */
	UserEntity findByUserName(String userName);
	
	/**
	 * Add new user
	 * 
	 * @param userEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewUser(UserEntity userEntity);
	
	/**
	 * Update user 
	 * 
	 * @param userEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateUser(UserEntity userEntity);
	
	/**
	 * Delete user
	 * 
	 * @param userId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteUserById(Integer userId);
	
}
