package com.springSecurity.SpringSecurityAssignment.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springSecurity.SpringSecurityAssignment.model.User;
import com.springSecurity.SpringSecurityAssignment.repository.UserRepository;


@Service
public class StudentUserDetailsService implements UserDetailsService {

	private UserRepository userRepository;
	
	
	
	public StudentUserDetailsService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user= userRepository.findByEmail(username)
	            .orElseThrow(() -> new UsernameNotFoundException("Username not found: " + username));
		return new StudentUserDetails(user);
	}
}