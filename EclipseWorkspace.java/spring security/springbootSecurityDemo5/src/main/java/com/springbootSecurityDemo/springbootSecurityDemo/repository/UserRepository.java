package com.springbootSecurityDemo.springbootSecurityDemo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springbootSecurityDemo.springbootSecurityDemo.model.StudentModel;


@Repository 
public interface UserRepository extends JpaRepository<StudentModel,Long> {
    // to avoid the nullpoint exceptionalclass(when a object(below one) of class(Studentmodel) may
	// contain data ot maynot) = Optional is used
	Optional<StudentModel> findByEmail(String email);
	
}
