package com.springSecurityDemo.springSecurityDemo.config;

import java.beans.Customizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.springSecurityDemo.springSecurityDemo.customHandler.CustomSuccessHandler;
import com.springSecurityDemo.springSecurityDemo.repository.StudentRepository;
import com.springSecurityDemo.springSecurityDemo.service.CustomUserDetailsService;
import static org.springframework.security.config.Customizer.withDefaults;


@Configuration
@EnableWebSecurity
public class SecurityConfig {
	

    private StudentRepository studentRepo;
    private CustomSuccessHandler customSuccessHandler; 

    

	public SecurityConfig(StudentRepository studentRepo, CustomSuccessHandler customSuccessHandler) {
		super();
		this.studentRepo = studentRepo;
		this.customSuccessHandler = customSuccessHandler;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailsService(studentRepo);
    }


	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setPasswordEncoder(passwordEncoder());
		provider.setUserDetailsService(userDetailsService());
		return provider;
		
	}
	
	
	//to overwrite/customize  the springsecuritylogin page to our cretaed login page
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
		return http
				.authorizeHttpRequests(auth -> auth
//						.requestMatchers("/user").hasRole("USER")
						.requestMatchers("/user").hasAnyRole("ADMIN","USER")
						.requestMatchers("/admin").hasRole("ADMIN")
						.requestMatchers("/","/about/**","/contact/**","/register/**").permitAll()
						.anyRequest().authenticated())
				.formLogin(login -> login
						.loginPage("/login")
						.loginProcessingUrl("/login") //processingurl == th:action mentioned in html
//						.defaultSuccessUrl("/std-details?loginSuccess",true) //after login it will redirect to std-details page
						//true means==> after login it not redirect to previous visted page(default
						//before appling  above line)
						//and redirect to std_details
						.successHandler(customSuccessHandler)
						.permitAll()
						)
				.exceptionHandling(
						exp -> exp.accessDeniedPage("/error"))
				.logout(logout -> logout
//						.logoutSuccessUrl("/login?logout") // 
						.permitAll())
				.build();
	}
}
