package com.example.DBRelationEmployee.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.EmployeeRepository;

import jakarta.mail.MessagingException;


@Service
public class RelationService {

	private EmployeeRepository employeeRepository;
	private PasswordEncoder passwordEncoder;
	
	
	
	public RelationService(EmployeeRepository employeeRepository, PasswordEncoder passwordEncoder) {
		super();
		this.employeeRepository = employeeRepository;
		this.passwordEncoder = passwordEncoder;
	}



	public void storeUser(EmployeeDTO userDTO) throws MessagingException
	{
		Employee user = new Employee (); // to convert from dto to model thid=s line
		//setname is taking from model and getname is takig from dto
		user.setName(userDTO.getName());
		user.setEmail(userDTO.getEmail());
		user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		employeeRepository.save(user);
		
}
}
