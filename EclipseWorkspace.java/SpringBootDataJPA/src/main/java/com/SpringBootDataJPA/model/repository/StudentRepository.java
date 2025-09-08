package com.SpringBootDataJPA.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SpringBootDataJPA.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {

	/*
	 * Repository:
	 ===============
	 	it is interface it is below ones
	 	which  --> crud rpository(interface) - jpa repoistory(interface)
	 	* if we need to extend interface we need child interface - i.e StudentRopistory
	
	 */
}
