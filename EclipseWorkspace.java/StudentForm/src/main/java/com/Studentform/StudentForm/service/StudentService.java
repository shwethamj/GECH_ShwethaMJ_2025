package com.Studentform.StudentForm.service;

import java.util.List;

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
	
	public List<StudentForm> getAllStudents(){
		List<StudentForm> students = studentRepository.findAll();
		return students;
	}


	public void saveStudent(StudentDTO studentDTO) {
		StudentForm student = new StudentForm();
		student.setName(studentDTO.getName());
		student.setAge(studentDTO.getAge());
		student.setEmail(studentDTO.getEmail());
		student.setAddress(studentDTO.getAddress());
		studentRepository.save(student);
	}

	
	public void deleteStudent(Long id) {
		StudentForm student = studentRepository.findById(id).get();
		studentRepository.delete(student);	
	}

	public StudentDTO editStudent(Long id) {
		StudentForm student = studentRepository.findById(id).get();
		StudentDTO  studentDTO = new StudentDTO();
		studentDTO.setName(student.getName());
		studentDTO.setAge(student.getAge());
		studentDTO.setEmail(student.getEmail());
		studentDTO.setAddress(student.getAddress());
		return studentDTO;
		
	}


	public void updateStudent(StudentDTO studentDTO, Long id) {
		StudentForm student = studentRepository.findById(id).get();
		student.setName(studentDTO.getName());
		student.setAge(studentDTO.getAge());
		student.setEmail(studentDTO.getEmail());
		student.setAddress(studentDTO.getAddress());
		studentRepository.save(student);
		
	}
}
