package com.smobile.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@Order(value = 99)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeRequests()
					.antMatchers("/","/css/**", "/js/**", "/images/**","/plugins/**","/login").permitAll()
					.antMatchers("/user/**", "/checkout/**", "/comment/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
					.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
					.anyRequest().authenticated()
			.and().formLogin().loginPage("/login")
					.loginProcessingUrl("/loginAction")
					.defaultSuccessUrl("/admin/product-list")
					.usernameParameter("username")
					.passwordParameter("password")
					.failureUrl("/login?error=true")
			.and().logout().logoutSuccessUrl("/login")
			.and().exceptionHandling().accessDeniedPage("/login");
		
			
	}
}