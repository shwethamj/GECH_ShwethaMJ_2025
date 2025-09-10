package com.SpringBootDataJPA.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.SpringBootDataJPA.model.Student;



@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

	Student findByEmail(String email);
//	Student findByAgeGreaterThan(int age);
	
	/*
	 * Repository:
	 ===============
	 	it is interface it is below ones
	 	which  --> crud rpository(interface) - jpa repoistory(interface)
	 	* if we need to extend interface we need child interface - i.e StudentRopistory
	
	 */
}
