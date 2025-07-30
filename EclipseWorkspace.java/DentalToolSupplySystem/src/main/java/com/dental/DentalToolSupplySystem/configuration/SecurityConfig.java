package com.dental.DentalToolSupplySystem.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;
import com.dental.DentalToolSupplySystem.service.CustomUserDetailsService;

@Configuration
public class SecurityConfig {

	private DentalToolRepository dentaltoolRepository;
	private CustomSuccessHandler customSuccessHandler;
	

	
	public SecurityConfig(DentalToolRepository dentaltoolRepository, CustomSuccessHandler customSuccessHandler) {
		super();
		this.dentaltoolRepository = dentaltoolRepository;
		this.customSuccessHandler = customSuccessHandler;
	}


	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	

	@Bean
	public UserDetailsService userDetailsService() {
		return new CustomUserDetailsService(dentaltoolRepository);
	}
	
	@Bean
	public DaoAuthenticationProvider doAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setPasswordEncoder(passwordEncoder());
		provider.setUserDetailsService(userDetailsService());
		return provider;
	}
	
	@Bean
	public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
	    return http.getSharedObject(AuthenticationManagerBuilder.class)
	            .authenticationProvider(doAuthenticationProvider())
	            .build();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		return http
				.authorizeHttpRequests(auth-> auth
						.requestMatchers("/admin_dashboard").hasRole("ADMIN")
//						.requestMatchers("/products").hasAnyRole("ADMIN", "USER", "SUPPLIER")
						.requestMatchers("/css/**", "/js/**", "/images/**", "/webjars/**","/","/about","/register","/contact","/categories","/cart","/checkouts","/products").permitAll()
						.anyRequest().authenticated()
						)
				.formLogin(login -> login
						.loginPage("/login")
						.loginProcessingUrl("/login")
						.usernameParameter("email")
						.successHandler(customSuccessHandler)
						.permitAll()
						)
				
				.logout(logout->logout
						.logoutSuccessUrl("/login?logout")
						.invalidateHttpSession(true)
						.deleteCookies("JSESSIONID")
						.permitAll())
				.build();
	}
}
