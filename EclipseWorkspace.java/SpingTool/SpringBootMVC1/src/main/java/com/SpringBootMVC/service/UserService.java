package com.SpringBootMVC.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.SpringBootMVC.model.User;
import com.SpringBootMVC.repository.UserRepository;

@Service
public class UserService {

	private UserRepository repository;

	public UserService(UserRepository repository) {
		super();
		this.repository = repository;
	}
	
	//getlist 
		public List<User> getAllStudents(){
			return repository.findAll();
		}
		
		//save
		public User saveStudent(User student) {
			return repository.save(student);
		}
}
