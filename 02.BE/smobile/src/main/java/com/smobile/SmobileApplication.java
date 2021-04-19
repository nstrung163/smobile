package com.smobile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@PropertySource({ "classpath:config/datasource.properties" })
@EnableTransactionManagement
public class SmobileApplication extends SpringBootServletInitializer {
	
	public static void main(String[] args) {
		System.out.println("Start up app");
		SpringApplication.run(SmobileApplication.class, args);
	}

}
