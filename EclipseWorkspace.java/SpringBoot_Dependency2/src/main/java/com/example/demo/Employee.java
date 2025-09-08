package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Employee {

	public String e_name;
	
	public Address addressOne;
	
	 Employee() { // call when object created
		System.out.println("Employee object creaed");
	}

	 //constructer injection
	 @Autowired
	 public Employee(@Value("shwetha") String e_name,@Qualifier("address1") Address addressOne) {
		super();
		this.e_name = e_name;
		this.addressOne = addressOne;
	 }

	 
	 
	 
}
