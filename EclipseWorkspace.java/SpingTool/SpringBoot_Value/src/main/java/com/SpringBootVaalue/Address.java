package com.SpringBootVaalue;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Address {

	@Value("karnataka")
	public String state;
	
	@Value("hassan")
	public String city;
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}




	public Address() {
		System.out.println("address object created");
	}
}