package com.SpringBootCRUD.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.SpringBootCRUD.model.Student;
import com.SpringBootCRUD.repository.StudentRepository;

@Service
public class StudentService {

	private final StudentRepository studentRepository;

	public StudentService(StudentRepository studentRepository) {
		super();
		this.studentRepository = studentRepository;
	}
	
	
	//getlist 
	public List<Student> getAllStudents(){
		return studentRepository.findAll();
	}
	
	//save
	public Student saveStudent(Student student) {
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