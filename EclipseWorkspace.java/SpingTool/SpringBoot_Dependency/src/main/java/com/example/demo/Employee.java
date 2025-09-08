package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Employee {

	public String e_name;
	
	//field injection
	
	@Qualifier("address1")
	@Autowired //inserting the object of address here
	public Address addressOne;
	
	//for @component object will create automaticaly
	
	 Employee() { //constructor will call when object created
		System.out.println("Employee object creaed");
	}
	 
	 
}
