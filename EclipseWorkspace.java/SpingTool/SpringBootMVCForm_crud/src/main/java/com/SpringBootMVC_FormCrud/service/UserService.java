package com.SpringBootMVC_FormCrud.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.SpringBootMVC_FormCrud.model.User;
import com.SpringBootMVC_FormCrud.repository.UserRepository;

@Service
public class UserService {

	private UserRepository repository;

	public UserService(UserRepository repository) {
		super();
		this.repository = repository;
	}
	
	public List<User> getAllStudent() {
		return repository.findAll();
	}
	
	//save
		public User saveStudent(User user) {
			return repository.save(user);
		}
		
		public void deleteUser(Integer id) {
			 repository.deleteById(id);
		}
		
		public User getUserById(Integer id) {
			return repository.findById(id).orElseThrow(null);
		}
		
		
		
}
