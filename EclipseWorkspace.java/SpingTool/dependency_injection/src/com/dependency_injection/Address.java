package com.dependency_injection;

public class Address {

	public String a_name;
	public String a_place;
	
	//setter injection
	public String name;
	public String getName() {
		return a_name;
	}
	public void setName(String a_name) {
		this.a_name = a_name;
	}
	
	
}
