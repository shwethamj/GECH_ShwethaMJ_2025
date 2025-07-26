package com.example.DBRelationEmployee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DBRelationEmployee.model.Task;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByEmployeeId(Long employeeId);
}
