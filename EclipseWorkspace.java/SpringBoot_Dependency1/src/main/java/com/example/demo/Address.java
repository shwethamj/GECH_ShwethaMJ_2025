package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class Address {

	private String a_name;
	
	public Address() {
		System.out.println("address object created");
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	
	
}

