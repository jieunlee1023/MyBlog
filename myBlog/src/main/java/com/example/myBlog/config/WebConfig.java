package com.example.myBlog.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);

		registry.addResourceHandler("/image/**")
		.addResourceLocations("file:///" + "C:\\MyBlog\\image\\blog-headLine\\")
		.setCachePeriod(60 * 10 * 6) 
		.resourceChain(true) 
		.addResolver(new PathResourceResolver());
		
	}
	
}
