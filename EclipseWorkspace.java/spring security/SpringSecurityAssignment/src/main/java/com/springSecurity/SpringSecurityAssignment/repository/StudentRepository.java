package com.springSecurity.SpringSecurityAssignment.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springSecurity.SpringSecurityAssignment.model.Student;
import com.springSecurity.SpringSecurityAssignment.model.User;

public interface StudentRepository extends JpaRepository<Student, Long> {
		Student findByEmail(String email);
		
}