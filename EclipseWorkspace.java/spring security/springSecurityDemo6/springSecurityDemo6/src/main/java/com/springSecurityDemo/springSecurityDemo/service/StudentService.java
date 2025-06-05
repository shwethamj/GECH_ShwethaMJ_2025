package com.springSecurityDemo.springSecurityDemo.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springSecurityDemo.springSecurityDemo.dto.StudentDTO;
import com.springSecurityDemo.springSecurityDemo.models.StudentModels;
import com.springSecurityDemo.springSecurityDemo.repository.StudentRepository;

import jakarta.mail.MessagingException;

@Service
public class StudentService {

	private StudentRepository studentRepo;
	private PasswordEncoder passwordEncoder;
	private EmailService emailService;

	

	public StudentService(StudentRepository studentRepo, PasswordEncoder passwordEncoder, EmailService emailService) {
		super();
		this.studentRepo = studentRepo;
		this.passwordEncoder = passwordEncoder;
		this.emailService = emailService;
	}



	public void storeStudent(StudentDTO studentDTO) throws MessagingException {
		StudentModels student = new StudentModels();

		student.setName(studentDTO.getName());
		student.setEmail(studentDTO.getEmail());
		student.setPassword(passwordEncoder.encode(studentDTO.getPassword()));
		student.setRole("ROLE_USER");
		studentRepo.save(student);
		
		emailService.sendEmail(studentDTO.getEmail(),studentDTO.getEmail(),studentDTO.getPassword(), studentDTO.getName());
	}
}