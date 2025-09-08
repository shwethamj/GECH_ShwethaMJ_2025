package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringBootConf {

	@Bean("customer1")
	public Customer customer() {
		
	//return new Customer(); //if we don't give any value to variable --> like default constructor
		
		//or 
		Customer c1 = new Customer();
		c1.name="shwetha";
		c1.age = 21;
		return c1;
	}
	
	@Bean //don't give bean name then  it defaulty take method_name(customer2) as bean name
	public Customer customer2() {
		Customer c1 = new Customer();
		return c1;
	}
	
	@Bean("customer3")
	public Customer customer3() {
		Customer c1 = new Customer();
		return c1;
	}
}
