package com.example.RestAPICrud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.RestAPICrud.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
}