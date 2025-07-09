package com.springbootSecurityDemo.springbootSecurityDemo.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

// how to override the default usename and password in spring security by creating a class configuration and like below 
// by default username is user and password will create in console by random when we use the security dependency

//the demo3 is the one way of authentication 
//there is 2way in authetication -->in memeory and database
//in memory- is hardcode which writen in configuration class -- we can access/login without storing to database -- it is non secure

// below is --> in memory userdetails manager 
@Configuration
public class UserConfiguration {
	
	@Bean //means object handle by spring called bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
	UserDetails user1 =	User.withUsername("shwetha")
			.password(passwordEncoder()
			.encode("shwetha123"))
			.roles("ADMIN").build();
	
	UserDetails user2 =	User.withUsername("gagan")
			.password(passwordEncoder()
			.encode("gagan"))
			.roles("USER").build();
	
	return new InMemoryUserDetailsManager(user1,user2); // no args constructor (method) in UserDetails pacalkage which will create and store UserDetails objects
	}
}
