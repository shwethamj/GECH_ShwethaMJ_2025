package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class Address {

	public String a_name;
	
	
	public Address(String a_name) {
		super();
		this.a_name = a_name;
	}	

	public Address() {
		System.out.println("address object created");
	}

	
	
}

