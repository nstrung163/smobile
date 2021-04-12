package com.smobile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@PropertySource({"classpath:config/datasource.properties"})
public class SmobileApplication {

	public static void main(String[] args) {
		System.out.println("Start up app");
		SpringApplication.run(SmobileApplication.class, args);
	}

}
