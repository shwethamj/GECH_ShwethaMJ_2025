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
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Employee employee = employeeRepository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("Employee not found with email: " + username));

        return new CustomEmployeeDetails(employee); // ✅ now correct
    }

    
}
