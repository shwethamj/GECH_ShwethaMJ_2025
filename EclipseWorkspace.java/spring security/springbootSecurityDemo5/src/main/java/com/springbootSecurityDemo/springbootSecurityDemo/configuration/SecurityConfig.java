package com.springbootSecurityDemo.springbootSecurityDemo.configuration;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.springbootSecurityDemo.springbootSecurityDemo.repository.UserRepository;
import com.springbootSecurityDemo.springbootSecurityDemo.service.CustomUserDetailService;

@Configuration

public class SecurityConfig {
	
	
	private  UserRepository userRepository;
	
	
	public SecurityConfig( UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}
	

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();	
	}
	@Bean
	public UserDetailsService userDetailsService() {
		return new CustomUserDetailService(userRepository);
	}
	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setPasswordEncoder(passwordEncoder());
		provider.setUserDetailsService(userDetailsService());
		return provider;
	}
	
}
