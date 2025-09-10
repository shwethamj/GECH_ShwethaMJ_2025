package com.SpringBootDataJPA.Configuaration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.SpringBootDataJPA.model.Student;
import com.SpringBootDataJPA.model.repository.StudentRepository;

@Configuration
public class StudentConfig {

   private StudentRepository studentRepository;
	
	public StudentConfig(StudentRepository studentRepository) {
	super();
	this.studentRepository = studentRepository;
}


//	@Bean
//	public Student student() {
//		Student std = new Student("shewtha", "swhet2gamil.com", 21, "jagadesh");
//		return  studentRepository.save(std);
//		
//	}

	
//	@Bean
//	CommandLineRunner student1() {
//		return args ->{
//			
//			 Student std1 = new Student("shwetha", "shwetha@gmail.com", 21, "jagadesh");
//	            Student std2 = new Student("sindu", "sindu@gmail.com", 22, "natraj");
//
//	            studentRepository.saveAll(List.of(std1, std2));
//		};
//	}
	
	
}
