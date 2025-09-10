package com.SpringBootDataJPA;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.SpringBootDataJPA.model.Student;
import com.SpringBootDataJPA.model.repository.EmployeeRepository;
import com.SpringBootDataJPA.model.repository.StudentRepository;

@Component
public class SpringData {
	@Autowired
	StudentRepository repository;
	
	public void addStudent() {	
		Student st = new Student("shweetha","shwetha@gmail.com",34,"jagadeesg");
		repository.save(st);
	}
	
	public void getStudent() {
		Student student = repository.findById(1).get();
		System.out.println("findById : "+student);		
	}
	
	public void findByEmail() {
		Student student = repository.findByEmail("shwetha@gmail.com");
		System.out.println("studnet by findByEmail : "+student);
		
	}
	
//	public void getOlderStudents() {
//	    Student students = repository.findByAgeGreaterThan(20);
//	   System.out.println("greater thAN AGE : "+students);
//	}

}
