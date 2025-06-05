package com.springbootSecurityDemo.springbootSecurityDemo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springbootSecurityDemo.springbootSecurityDemo.DTO.StudentDTO;
import com.springbootSecurityDemo.springbootSecurityDemo.model.StudentModel;
import com.springbootSecurityDemo.springbootSecurityDemo.repository.UserRepository;

@Service
public class StudentService {
	private UserRepository userRepository;

	public StudentService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void storeStudent(StudentDTO  studentDTO) {
		StudentModel student = new StudentModel();
		student.setName(studentDTO.getName());
		student.setEmail(studentDTO.getEmail());
		student.setPassword(passwordEncoder.encode(studentDTO.getPassword()));
		student.setRole("ROLE_USER");
		userRepository.save(student);
	}
}
