package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Employee {

	public String e_name;
	
	public Address addressOne;
	
	 Employee() { // call when object created
		System.out.println("Employee object creaed");
	}

	 public String getE_name() {
		 return e_name;
	 }

	 public void setE_name(String e_name) {
		 this.e_name = e_name;
	 }

	 public Address getAddressOne() {
		 return addressOne;
	 }

	 //setter injection
	 @Qualifier("address1") //which object need to consider
	 @Autowired
	 public void setAddressOne(Address addressOne) {
		 this.addressOne = addressOne;
	 }
	 
	 
}
