package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class Address {

	public String a_name;
	
	public Address() {
		System.out.println("address object created");
	}
}
