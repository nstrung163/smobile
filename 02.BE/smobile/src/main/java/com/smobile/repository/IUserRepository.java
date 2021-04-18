package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.UserEntity;

public interface IUserRepository extends JpaRepository<UserEntity, Integer> {

	UserEntity findByUserId(Integer userId);
	
	UserEntity findByUserName(String userName);
	
}
