package com.ryan.insta;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class InstaPrjApplication  {

	private static final Logger log = LoggerFactory.getLogger(InstaPrjApplication.class);
	 
	public static void main(String[] args) {
		SpringApplication.run(InstaPrjApplication.class, args);
		log.info("============= SpringBoot Start Success =============");
	}
	
}
