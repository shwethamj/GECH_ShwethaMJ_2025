package com.example.employeeform.employeevalidation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.employeeform.employeevalidation.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    /*
     * Spring Data JPA layers:
     * 
     * 1. To fetch all records -> findAll()
     * 2. To fetch a single record -> findById()
     * 3. To delete a record -> deleteById()
     * 4. To save or update a record -> save()
     * 
     * Additional Features of JpaRepository:
     * - Pagination support
     * - Sorting capabilities
     */
	public Employee findByEmail(String email);
}

