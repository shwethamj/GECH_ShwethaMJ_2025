package com.SpringBootVaalue;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class Student {

	public String name;
    private int age ;
    
    @Autowired
	Address address;


	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Student() {
		System.out.println("student object created");
	}

	//for constructor
	@Autowired //bcs i have default constructor so if not given then it will consider that default constrcutor and gives as null
	public Student(@Value("${student.name}")String name,@Value("45") int age, Address address) {
		super();
		this.name = name;
		this.age = age;
		this.address = address;
		
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + ", address=" + address + "]";
	}
	
	int roll;
	String marks;
	@Autowired
	public void method(@Value("${student.roll}") int roll ,@Value("${student.marks}") String marks) {
		this.roll =roll;
		this.marks=marks;
		System.out.println("roll no : "+this.roll + " and marks : "+this.marks);
	}
	
	/*
	 * this.roll =roll;
		this.marks=marks; if not given
	 *  n✅ At startup, Spring will still inject values from application.properties and print them.

		❌ But your class fields roll and marks will remain uninitialized (default values: 0 for int, null for String).
	 */
	
}
