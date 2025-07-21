package com.example.DBRelationEmployee.securityconfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.service.CustomEmployeeDetailsService;

@Configuration
public class SecurityConfig {

    private final EmployeeRepository employeeRepository;
    private final SuccessHandler successHandler;
    private final CustomEmployeeDetailsService userDetailsService;

    public SecurityConfig(EmployeeRepository employeeRepository,
                          SuccessHandler successHandler,
                          CustomEmployeeDetailsService userDetailsService) {
        this.employeeRepository = employeeRepository;
        this.successHandler = successHandler;
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/users/**", "/roles/**", "/dashboard").hasRole("ADMIN")
                .requestMatchers("/login", "/register", "/home", "/", "/about", "/contact", "/notes/**", "/css/**", "/js/**").permitAll()
                .anyRequest().permitAll()  // Allow all other requests without authentication
            )
            .formLogin(form -> form
                .loginPage("/login")
                .successHandler(successHandler) // Custom redirect logic
                .permitAll()
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            )
            .csrf(csrf -> csrf.disable()); // Optional: disable CSRF for dev simplicity
        return http.build();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setPasswordEncoder(passwordEncoder());
        provider.setUserDetailsService(userDetailsService);
        return provider;
    }
}
