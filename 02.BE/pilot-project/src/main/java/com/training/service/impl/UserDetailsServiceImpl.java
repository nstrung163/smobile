//package com.training.service.impl;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.training.entity.UserEntity;
//import com.training.service.IUserService;
//
//@Service
//public class UserDetailsServiceImpl implements UserDetailsService {
//	@Autowired
//	IUserService userService;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		UserEntity userEntity = userService.findByUsername(username); 
//		if (userEntity != null) {
//			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>(); 
//			authorities.add(new SimpleGrantedAuthority(userEntity.getRole()));
//			
//			User user = new User(userEntity.getUsername(), userEntity.getPassword(), authorities); 
//			return user;
//		} else {
//			throw new UsernameNotFoundException("User not found!");
//		}
//	}
//}