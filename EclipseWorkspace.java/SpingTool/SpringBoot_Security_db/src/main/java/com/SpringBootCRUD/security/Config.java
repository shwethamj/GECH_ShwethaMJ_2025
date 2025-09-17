package com.SpringBootCRUD.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;
import com.SpringBootCRUD.repository.StudentRepository;
import com.SpringBootCRUD.service.studentUserDetailService;

@Configuration
public class Config {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new studentUserDetailService();
	}
	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setPasswordEncoder(passwordEncoder());
		provider.setUserDetailsService(userDetailsService());
		return provider;
	}
	
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
		return http
				.authorizeHttpRequests(auth->
				auth.requestMatchers("/","/add","/save").permitAll()
				.anyRequest().authenticated())
//				.formLogin(withDefaults()) //to take default form from springsecurity
				.formLogin(form -> form
						.loginPage("/login")
						.permitAll())
				.logout(logout -> logout
						.logoutUrl("/logout")
						.permitAll())
				.build();
	}
					
	
}
