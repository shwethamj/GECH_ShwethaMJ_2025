package com.SpringBootCRUD.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.SpringBootCRUD.model.Student;

public class StudentDetails implements UserDetails {

	private Student student; 
	
	public StudentDetails(Student student) {
		super();
		this.student = student;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return List.of(new SimpleGrantedAuthority(student.getRole()));
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return student.getPassword() ;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return student.getEmail();
	}

	 
}
