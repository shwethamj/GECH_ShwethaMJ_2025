package com.SpringBootDataJPA.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SpringBootDataJPA.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
