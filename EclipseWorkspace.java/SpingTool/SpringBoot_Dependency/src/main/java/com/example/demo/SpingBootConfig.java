package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpingBootConfig {

	//for address class now we have 3 obje --> address(which created in class using @component) , address1,address2
	@Bean("address1")
	public Address address1() {
		return new Address();
	}
	
	@Bean("address2")
	public Address address2() {
		return new Address();
	}
}
