package com.training.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// User Permission 
		http.authorizeRequests()
				.antMatchers("/css/**", "/js/**", "/images/**","/plugins/**", "/*", "/**/*", "/**/**/*").permitAll()
				.and() // Disable CRSF check
						.csrf().disable();
	}
}