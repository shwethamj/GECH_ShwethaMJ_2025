package com.example.DBRelationEmployee.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.EmployeeRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CustomEmployeeDetailsService implements UserDetailsService  {

    private final EmployeeRepository employeeRepository;

    public CustomEmployeeDetailsService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    @Transactional 

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("2222222222222"+username);
		Employee user =employeeRepository.findByEmail(username).orElseThrow(
				()->new UsernameNotFoundException("User not found with provided email "+username));
		System.out.println(user+"11111111111111111111");
		// Force initialize roles collection while still in transaction/session
	    user.getRoles().size();
		return new CustomEmployeeDetails(user);
	}
}
