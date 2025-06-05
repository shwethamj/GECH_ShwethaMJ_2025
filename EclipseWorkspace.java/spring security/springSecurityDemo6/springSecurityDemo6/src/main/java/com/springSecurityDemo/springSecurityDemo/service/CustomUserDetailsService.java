package com.springSecurityDemo.springSecurityDemo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springSecurityDemo.springSecurityDemo.models.StudentModels;
import com.springSecurityDemo.springSecurityDemo.repository.StudentRepository;


public class CustomUserDetailsService implements UserDetailsService {

    private StudentRepository studentRepo;

    public CustomUserDetailsService(StudentRepository studentRepo) {
    	super();
        this.studentRepo = studentRepo;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        StudentModels student = studentRepo.findByEmail(username)
            .orElseThrow(() -> new UsernameNotFoundException("Username not found: " + username));
        //System.out.println("student: "+student);
        return new CustomUserDetails(student); 
    }
}
