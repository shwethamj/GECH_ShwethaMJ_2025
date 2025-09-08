package com.SpringBootVaalue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Address {

	public String state;
	
	@Value("hassan")
	public String city;
	
	public String getState() {
		return state;
	}

	//for method with one parameter--> @value at the top of method
	//if we have multiple parameter -->if  @value at the top of method (takes the same value for all paramter)
	//	--> then need to give in near parameter ->()--> like given in constructor
	@Value("${address.state}")
	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}


	@Override
	public String toString() {
		return "Address [state=" + state + ", city=" + city + "]";
	}

}