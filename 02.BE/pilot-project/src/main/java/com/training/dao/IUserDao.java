package com.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.training.entity.UserEntity;

@Repository
public interface IUserDao extends JpaRepository<UserEntity, String>{
	
	/**
	 * Find user by username
	 * 
	 * @param username
	 * @return user
	 */
	UserEntity findByUsername(String username);
	
	/**
	 * Find user by usernam and password
	 * 
	 * @param username
	 * @param password
	 * @return user
	 */
	@Query(value = "SELECT user FROM UserEntity user WHERE user.username = :username AND user.password = :password")
	UserEntity findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
	
}