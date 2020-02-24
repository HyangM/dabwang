package com.ksh.dabang.config;

import javax.servlet.MultipartConfigElement;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Value("${file.path}")
	private String fileRealPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);

		// 파일 경로 인식하게 하기.!!
		registry.addResourceHandler("/media/**").addResourceLocations("file:///" + fileRealPath).setCachePeriod(3600)
				.resourceChain(true).addResolver(new PathResourceResolver());
	}

	// 윤정추가.
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();

//		factory.setMaxFileSize(uploadMaxFileSize);
//		factory.setMaxRequestSize(uploadMaxRequestSize);

		return factory.createMultipartConfig();
	}
	@Bean
	public MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();  //return new CommonsMultipartResolver();
	}
	
	



}
