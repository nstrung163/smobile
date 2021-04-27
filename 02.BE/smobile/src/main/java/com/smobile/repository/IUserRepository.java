package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.smobile.entity.UserEntity;

@Transactional
public interface IUserRepository extends JpaRepository<UserEntity, Integer> {

	UserEntity findByUserId(Integer userId);
	
	UserEntity findByUsername(String userName);
	
	@Query(value = "SELECT * FROM USER WHERE USERNAME = :USERNAME AND PASSWORD = :PASSWORD", nativeQuery = true)
	UserEntity findUserByUsernameAndPassword(@Param("USERNAME") String username, @Param("PASSWORD") String password);
}
