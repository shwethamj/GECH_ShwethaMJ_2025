package com.SpringBootVaalue;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class SpringBootValueApplication {

	public static void main(String[] args) {

		ConfigurableApplicationContext run =	SpringApplication.run(SpringBootValueApplication.class, args);
			
		Student student = (Student)run.getBean("student");
		Address address = (Address)run.getBean("address");
		
		
		student.name="shwetha1"; //here not given then takes the value from the application property
		
		System.out.println("student name : "+student.getName());
		System.out.println("student age : "+student.getAge());
		System.out.println("student address from student : "+student.getAddress().getCity() +" - "+student.getAddress().getState());
		
		System.out.println("student list is : "+student.list);
		System.out.println("map : "+student.map);
	}

}
