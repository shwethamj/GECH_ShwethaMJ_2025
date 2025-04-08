package com.Studentform.StudentForm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Studentform.StudentForm.models.StudentForm;

public interface StudentRepository extends JpaRepository<StudentForm, Long> { // model file name,id type
	
	/*
	 * LOng -datatype of the id(primary data)
	 * 
	 * Spring Data JPA ==> jpa ->hibernate-> jdbc(java database connector)->database
	 * 
	 * 1. to get all => findAll()
	 * 2.to get single data => getById();
	 * 3.to delete data => deeleteById(); / delete(object)
	 * 4.to create or update data => save(object)
	 * 
	 * 
	 */

	// below one means =select from StudentForm where email
	public  StudentForm findByEmail(String email);
	
}
