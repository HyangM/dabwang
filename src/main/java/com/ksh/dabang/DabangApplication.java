package com.ksh.dabang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.filter.HiddenHttpMethodFilter;


@EnableAspectJAutoProxy
@SpringBootApplication
public class DabangApplication {

	public static void main(String[] args) {
		SpringApplication.run(DabangApplication.class, args);
	}
	
	// form:form 을 위한 필터
	// org.springframework.web.filter.HiddenHttpMethodFilter;
	@Bean
	public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
	    HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
	    return filter;
	}
}