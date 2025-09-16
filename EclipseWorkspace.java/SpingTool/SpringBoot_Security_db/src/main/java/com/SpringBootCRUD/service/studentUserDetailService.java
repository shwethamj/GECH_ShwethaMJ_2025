package com.SpringBootCRUD.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.SpringBootCRUD.model.Student;
import com.SpringBootCRUD.repository.StudentRepository;

@Service
public class studentUserDetailService implements UserDetailsService{
	
	@Autowired
	private StudentRepository repository;

	public studentUserDetailService(StudentRepository repository) {
		super();
		this.repository = repository;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Student std =  repository.findByEmail(username)
				.orElseThrow(
				() -> new UsernameNotFoundException("user not found : "+username)
				);
		return new StudentDetails(std);
	}
	
	

}
