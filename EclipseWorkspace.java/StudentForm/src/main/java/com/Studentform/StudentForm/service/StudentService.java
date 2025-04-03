package com.Studentform.StudentForm.service;

import org.springframework.stereotype.Service;

import com.Studentform.StudentForm.dto.StudentDTO;
import com.Studentform.StudentForm.models.StudentForm;
import com.Studentform.StudentForm.repository.StudentRepository;

@Service
public class StudentService {
	
	public StudentRepository studentRepository;
	
	//constructor injection
	public StudentService(StudentRepository studentRepository) {
		super();
		this.studentRepository = studentRepository;
	}


	public void saveStudent(StudentDTO studentDTO) {
		StudentForm student = new StudentForm();
		student.setName(studentDTO.getName());
		student.setAge(studentDTO.getAge());
		student.setEmail(studentDTO.getEmail());
		student.setAddress(studentDTO.getAddress());
		studentRepository.save(student);
	}

}
