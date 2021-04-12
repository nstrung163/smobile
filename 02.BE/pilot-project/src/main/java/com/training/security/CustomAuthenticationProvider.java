package com.training.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.training.common.util.FileHelper;
import com.training.entity.UserEntity;
import com.training.service.IUserService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	IUserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = authentication.getName();
		String password = authentication.getCredentials().toString();
		String encryptPassword = FileHelper.enrcyptMD5(password);
		UsernamePasswordAuthenticationToken usernamePassAuthToken = null;
		UserEntity loginUser = userService.login(username, encryptPassword);
		
		if (loginUser != null ) {
			List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
			grantedAuths.add(new SimpleGrantedAuthority(loginUser.getRole()));
			usernamePassAuthToken = new UsernamePasswordAuthenticationToken(username, StringUtils.EMPTY, grantedAuths);
		}
		return usernamePassAuthToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}