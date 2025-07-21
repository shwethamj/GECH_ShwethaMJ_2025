package com.example.DBRelationEmployee.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Address;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.RolesRepository;


@Service
public class EmployeeService {
	
	private PasswordEncoder passwordEncoder;
	private EmployeeRepository userRepository;
	private RolesRepository roleRepository;


	public EmployeeService(PasswordEncoder passwordEncoder, EmployeeRepository userRepository,
			RolesRepository roleRepository) {
		super();
		this.passwordEncoder = passwordEncoder;
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
	}



	public void saveUser(EmployeeDTO userDTO) {
		Employee user = new Employee();
		user.setName(userDTO.getName());
		user.setEmail(userDTO.getEmail());
		user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		Address  address = new Address();
		address.setAddress(userDTO.getAddress());
		user.setAddress(address);
		if (userDTO.getRoles() == null || userDTO.getRoles().isEmpty()) {
		    Roles defaultRole = roleRepository.findByRolename("ROLE_USER")
		        .orElseThrow(() -> new RuntimeException("Default role not found"));
		    HashSet<Roles> defaultRoles = new HashSet<>();
		    defaultRoles.add(defaultRole);
		    user.setRoles(defaultRoles);
		} else {
		    List<Roles> roles = roleRepository.findAllById(userDTO.getRoles());
		    user.setRoles(new HashSet<>(roles));
		}

		userRepository.save(user);
	}



	public void updateUser(EmployeeDTO userDTO, Long id) {
		Employee user = userRepository.findById(id).orElseThrow(()-> new UsernameNotFoundException("user not found"));
		user.setName(userDTO.getName());
		user.setEmail(userDTO.getEmail());
		if(! userDTO.getPassword().isEmpty()) {
			user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		}
		Address address = new Address();
		address.setAddress(userDTO.getAddress());
		user.setAddress(address);
		List<Roles> roles =  roleRepository.findAllById(userDTO.getRoles());
		for(var role :user.getRoles()) {
			role.getEmployee().remove(user);
		}
		user.setRoles( new HashSet<>(roles));
		userRepository.save(user);
	}



	public static Employee getEmployeeById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
}
