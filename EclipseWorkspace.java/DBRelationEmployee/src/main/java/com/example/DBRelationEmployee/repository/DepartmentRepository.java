package com.example.DBRelationEmployee.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.model.Employee;



@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

	Optional<Department> findByTitle(String title); // ✅ Correct;
	List<Department> findByEmployee(Employee employee); // ✅ Correct

	
}