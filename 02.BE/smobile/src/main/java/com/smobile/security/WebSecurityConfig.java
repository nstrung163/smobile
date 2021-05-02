package com.smobile.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeRequests()
					.antMatchers("/home/**", "/css/**", "/js/**", "/images/**", "/plugins/**", "/login", "/home", "/user/**").permitAll()
					.antMatchers("/account", "/checkout/**", "/comment/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
					.antMatchers("/admin/**", "/admin").access("hasRole('ROLE_ADMIN')")
					.anyRequest().authenticated()
			.and().formLogin().loginPage("/login")
					.loginProcessingUrl("/loginAction")
					.defaultSuccessUrl("/home")
					.usernameParameter("username")
					.passwordParameter("password")
					.failureUrl("/login?error=true")
			.and().exceptionHandling().accessDeniedPage("/login")
			.and().logout().logoutUrl("/logout").logoutSuccessUrl("/home");
	}
}