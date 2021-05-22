package com.smobile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.smobile.entity.UserEntity;

@Transactional
public interface IUserRepository extends JpaRepository<UserEntity, Integer> {

	@Query(value = "SELECT * FROM USER WHERE STATUS_USER = 1", nativeQuery = true)
	List<UserEntity> findAllUser();
	
	UserEntity findByUserId(Integer userId);
	
	UserEntity findByUsername(String userName);
	
	@Query(value = "SELECT * FROM USER WHERE USERNAME = :USERNAME AND PASSWORD = :PASSWORD AND STATUS_USER = 1", nativeQuery = true)
	UserEntity findUserByUsernameAndPassword(@Param("USERNAME") String username, @Param("PASSWORD") String password);
}
