package com.Studentform.StudentForm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Studentform.StudentForm.models.StudentForm;

public interface StudentRepository extends JpaRepository<StudentForm, Long> { // model file name,id type

}
