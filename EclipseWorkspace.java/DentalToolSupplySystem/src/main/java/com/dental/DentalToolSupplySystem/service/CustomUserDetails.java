package com.dental.DentalToolSupplySystem.service;

import java.util.Collection;
import java.util.List;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.dental.DentalToolSupplySystem.model.DentalTool;


public class CustomUserDetails implements UserDetails {

	private DentalTool dental ;
	
	public CustomUserDetails(DentalTool dental) { 
		super();
		this.dental = dental;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority(dental.getRole()));
	}

	@Override
	public String getPassword() {
		return dental.getPassword();
	}

	@Override
	public String getUsername() {
		return dental.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	
}
