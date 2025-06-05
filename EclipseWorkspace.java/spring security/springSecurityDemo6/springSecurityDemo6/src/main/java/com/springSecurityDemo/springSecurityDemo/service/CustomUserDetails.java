package com.springSecurityDemo.springSecurityDemo.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.springSecurityDemo.springSecurityDemo.models.StudentModels;


public class CustomUserDetails implements UserDetails{

	
	private StudentModels student;
	
//	GrantedAuthority - Authority by roles
//	SimpleGrantedAuthority - its a class
	
	public CustomUserDetails(StudentModels student) {
		super();
		this.student = student;
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority(student.getRole()));
	}



	@Override
	public String getPassword() {
		return student.getPassword();
	}

	@Override
	public String getUsername() {
		return student.getEmail();
	}

}
