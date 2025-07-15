package com.springSecurity.SpringSecurityAssignment.conig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.springSecurity.SpringSecurityAssignment.repository.UserRepository;
import com.springSecurity.SpringSecurityAssignment.service.StudentUserDetailsService;

@Configuration
@EnableWebSecurity 
public class Securityconfig {

	private final UserRepository userRepository;

	public Securityconfig(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}

	@Bean
	public UserDetailsService userDetailsService() {
	    return new StudentUserDetailsService(userRepository);
	}

	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
	    DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
	    provider.setPasswordEncoder(passwordEncoder());
	    provider.setUserDetailsService(userDetailsService());
	    return provider;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    return http
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers("/user").hasAnyRole("ADMIN", "USER")
	            .requestMatchers("/admin").hasRole("ADMIN")
	            .requestMatchers("/", "/about/**", "/contact/**", "/register/**").permitAll()
	            .anyRequest().authenticated())
	        .formLogin(login -> login
	        	    .loginPage("/login")
	        	    .loginProcessingUrl("/login") 
	        	    .defaultSuccessUrl("/std_details", true) // Force redirect after successful login
	        	    .permitAll()
	        	)

	        .exceptionHandling(exp -> exp.accessDeniedPage("/error"))
	        .logout(logout -> logout
	            .logoutSuccessUrl("/login?logout")
	            .permitAll())
	        .build();
	}
}