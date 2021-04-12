package com.training.config;

import javax.servlet.ServletContext;

import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.training.common.constant.Constants;
import com.training.common.util.CommonUtil;

@Configuration
@ComponentScan(basePackages = "com.training")
public class ServletContextInitializerConfig implements ServletContextInitializer{

	@Override
	public void onStartup(ServletContext servletContext) {
		System.setProperty(Constants.PROP_KEY_ROOT_FOLDER, CommonUtil.readProperties(Constants.PROP_KEY_ROOT_FOLDER, "config/application.properties"));
	}
	
}
