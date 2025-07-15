package com.example.DBRelationEmployee.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DBRelationEmployee.model.Department;

public interface DepartmentRepository extends JpaRepository<Department, Long> {

	
	Optional<Department> findByTitle(String title);
	
}
