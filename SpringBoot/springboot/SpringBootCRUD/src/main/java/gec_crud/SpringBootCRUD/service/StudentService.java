package gec_crud.SpringBootCRUD.service;

import org.springframework.stereotype.Service;
import gec_crud.SpringBootCRUD.dto.StudentDto;

import gec_crud.SpringBootCRUD.models.Student;
import gec_crud.SpringBootCRUD.repository.StudentRepository;

import java.util.List;


@Service

public class StudentService {

	private final StudentRepository studentRepository; //field ingestion

	public StudentService(StudentRepository studentRepository) { //constructor ingestion
		super();
		this.studentRepository = studentRepository;
	}
	//to get list of stydents
	public List<Student>getAllStudents(){
		List<Student> students =studentRepository.findAll();
		// list is a more than one data list<student> means list of student
		return students;
}
	public void saveStudent(StudentDto studentDto) {
		Student student = new Student();
		student.setFname(studentDto.getFname());
		student.setLname(studentDto.getLname());
		student.setEmail(studentDto.getEmail());
		student.setPhone(studentDto.getPhone());
		student.setAddress(studentDto.getAddress());
		studentRepository.save(student);
	}
	
	public Student getStudent(Long id) {
		Student student= studentRepository.findById(id).get();
		return student;
	}
	public void updateStudent(StudentDto studentDto,Long id) {
		Student student = studentRepository.findById(id).get();
		student.setFname(studentDto.getFname());
		student.setLname(studentDto.getLname());
		student.setEmail(studentDto.getEmail());
		student.setPhone(studentDto.getPhone());
		student.setAddress(studentDto.getAddress());
		studentRepository.save(student);
	}
	public void deleteStudent(Long id) {
		// TODO Auto-generated method stub
		studentRepository.deleteById(id);
		
	}
	
	
	
	
	
}
