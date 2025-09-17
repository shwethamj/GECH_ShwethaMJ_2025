package com.SpringBootCRUD.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.SpringBootCRUD.model.Student;
import com.SpringBootCRUD.repository.StudentRepository;

@Service
public class StudentService {

	private final StudentRepository studentRepository;
	private PasswordEncoder passwordEncoder;
	
	
	public StudentService(StudentRepository studentRepository, PasswordEncoder passwordEncoder) {
		super();
		this.studentRepository = studentRepository;
		this.passwordEncoder = passwordEncoder;
	}

	//getlist 
	public List<Student> getAllStudents(){
		return studentRepository.findAll();
	}
	
	//save
	public Student saveStudent(Student student) {
		  student.setPassword(passwordEncoder.encode(student.getPassword()));
	        student.setRole("ROLE_USER");
	        studentRepository.save(student);
		return studentRepository.save(student);
	}
	
	//read
	public Student getStudentById(Long id) {
		return studentRepository.findById(id).orElse(null);
	}
	
	//delete
	public void deleteStudent(Long id) {
		studentRepository.deleteById(id);
	}
	
}