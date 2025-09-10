package com.SpringBootVaalue;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Student {

	//takes the value from application property
	@Value("${student.name}")//@value(${property_naem})
	String name;
	
	@Value("23")
	 private int age ;
	
	//for list
	@Value("${student.list}")
	public List<String> list;
	
	/*for map
	 * @Value("${...}") → good for String, int, boolean, List.
	   @Value("#{${...}}") → needed for Map, because Spring must parse and evaluate
		 		the whole string as a map expression.
	 # -->With #{...}, Spring evaluates that string as a map literal
	 without # --> treat as only String
	 */
	@Value("#{${student.map}}")
	public Map<Integer, String> map;
	
	@Autowired
	Address address;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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


	
}
