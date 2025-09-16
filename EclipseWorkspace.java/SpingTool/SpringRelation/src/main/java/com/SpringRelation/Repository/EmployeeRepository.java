package com.SpringRelation.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SpringRelation.model.Employee;

public interface EmployeeRepository  extends JpaRepository<Employee, Integer>{

}
