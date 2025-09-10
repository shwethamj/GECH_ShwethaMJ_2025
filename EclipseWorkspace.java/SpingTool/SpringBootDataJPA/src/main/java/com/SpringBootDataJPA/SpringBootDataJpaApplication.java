package com.SpringBootDataJPA;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.SpringBootDataJPA.model.Student;

@SpringBootApplication
public class SpringBootDataJpaApplication {

	public static void main(String[] args) {

		ConfigurableApplicationContext run = SpringApplication.run(SpringBootDataJpaApplication.class, args);
		
		SpringData student = run.getBean(SpringData.class);
		student.addStudent();
		student.getStudent();
		student.findByEmail();
//		student.getOlderStudents();
	}
	

}
