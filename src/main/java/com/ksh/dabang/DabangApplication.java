package com.ksh.dabang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@EnableAspectJAutoProxy
@SpringBootApplication
public class DabangApplication {

	public static void main(String[] args) {
		SpringApplication.run(DabangApplication.class, args);
	}

}