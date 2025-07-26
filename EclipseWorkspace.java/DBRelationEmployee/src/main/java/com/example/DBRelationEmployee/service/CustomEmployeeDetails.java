package com.example.DBRelationEmployee.service;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.DBRelationEmployee.model.Employee;

public class CustomEmployeeDetails implements UserDetails {

    private final Employee user;

    public CustomEmployeeDetails(Employee employee) {
        this.user = employee;
    }
    public String getName() {
		return user.getName();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return user.getRoles().stream().map(role -> new SimpleGrantedAuthority("ROLE_" + role.getRolename()))
				.collect(Collectors.toSet());
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getEmail();
	}

	public String getAddress() {
		return user.getAddress().getAddress();
	}
	
	public Employee getEmployee() {
        return user;
    }


}
