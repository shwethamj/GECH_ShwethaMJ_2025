package com.example.DBRelationEmployee.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.model.Employee;


@Repository

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	List<Employee> findByDepartment(Department department);
    Optional<Employee> findByEmail(String email);
    

}