package com.springSecurityDemo.springSecurityDemo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springSecurityDemo.springSecurityDemo.models.StudentModels;

@Repository
public interface StudentRepository extends  JpaRepository<StudentModels, Long> {
	//Optional Class is used to avoid null-pointer Exception, It is used when a object of class may contain data or may not contain (i.e null).
	Optional<StudentModels> findByEmail(String email);
}
