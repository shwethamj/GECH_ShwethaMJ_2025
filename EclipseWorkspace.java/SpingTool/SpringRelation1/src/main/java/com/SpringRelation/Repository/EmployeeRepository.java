package com.SpringRelation.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SpringRelation.model.User;



public interface EmployeeRepository  extends JpaRepository<User, Integer>{

}
