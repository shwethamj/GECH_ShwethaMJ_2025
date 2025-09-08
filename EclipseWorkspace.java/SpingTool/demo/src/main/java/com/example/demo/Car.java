package com.example.demo;

import org.springframework.stereotype.Component;

@Component("car1")//if we dont provide the component class name(which is treated as object name) then class name is taken as bean name
//component class bean will create under only base package
public class Car {

	String name;
	String model;
	int no_w;
	
	public Car() { //default construnctor to check object created or not
		System.out.println("car object created");
	}
	
	/*
	  how we create object using ioc container:
	 ========================================
	 * @component -->if we use this -> when we want default value
	 * @bean --> use this -> when we want custom value
	 
	 @COMPONENT :
	 ============
	 FOLLOW 
	 * need to have @component
	 * automatically creates the object no need to create object
	 *object name = componant name
	 *componant name not give ==>takes the class name by default as obj name (component name)
	 
	 * base package --> package which created when project is created --> ex :SpingBootApp
	 * valid --> com.SpringBootApp.model (new package name) --> we can create obj
	 * invalid --> model --> we cannot create object(bean)
	 */
}
