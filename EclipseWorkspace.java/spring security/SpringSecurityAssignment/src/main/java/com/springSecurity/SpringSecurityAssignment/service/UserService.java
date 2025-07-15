package com.springSecurity.SpringSecurityAssignment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springSecurity.SpringSecurityAssignment.DTO.StudentDTO;
import com.springSecurity.SpringSecurityAssignment.DTO.UserDTO;
import com.springSecurity.SpringSecurityAssignment.model.Student;
import com.springSecurity.SpringSecurityAssignment.model.User;
import com.springSecurity.SpringSecurityAssignment.repository.StudentRepository;
import com.springSecurity.SpringSecurityAssignment.repository.UserRepository;

import jakarta.mail.MessagingException;



@Service
public class UserService {
	
	private UserRepository userRepository;
	private PasswordEncoder passwordEncoder;
	private StudentRepository studentrepository;

	
	
    	

		public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder,
			StudentRepository studentrepository) {
		super();
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.studentrepository = studentrepository;
	}

		public void storeUser(UserDTO userDTO) throws MessagingException{
    		User user = new User(); // to convert from dto to model thid=s line
    		//setname is taking from model and getname is takig from dto
    		user.setName(userDTO.getName());
    		user.setEmail(userDTO.getEmail());
    		user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
    		userRepository.save(user);
    		
    }
		
		public List<Student> getAllStudent() {
		    return studentrepository.findAll();
		}
		
		public void saveStudent(StudentDTO dto) {
	        Student student = new Student();
	        student.setName(dto.getName());
	        student.setEmail(dto.getEmail());
	        studentrepository.save(student);
	    }

	    // Delete student by ID
	    public void deleteStudent(Long id) {
	        studentrepository.deleteById(id);
	    }

	    // Get student by ID for editing
	    public StudentDTO getStudentById(Long id) {
	        Student student = studentrepository.findById(id).orElseThrow(() -> new RuntimeException("Student not found"));
	        StudentDTO dto = new StudentDTO();
	        dto.setName(student.getName());
	        dto.setEmail(student.getEmail());
	        return dto;
	    }

	    // Update student
	    public void updateStudent(StudentDTO dto, Long id) {
	        Student student = studentrepository.findById(id).orElseThrow(() -> new RuntimeException("Student not found"));
	        student.setName(dto.getName());
	        student.setEmail(dto.getEmail());
	        studentrepository.save(student);
	    }

		
		    
}
