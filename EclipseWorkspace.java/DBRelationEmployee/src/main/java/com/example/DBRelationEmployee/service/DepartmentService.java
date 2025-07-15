package com.example.DBRelationEmployee.service;

import com.example.DBRelationEmployee.DTO.DepartmentDTO;
import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.DepartmentRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    private final DepartmentRepository departmentRepository;

    public DepartmentService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public void saveDepartment(@Valid DepartmentDTO departmentDTO) {
        Department department = new Department();
        department.setTitle(departmentDTO.getTitle().toUpperCase());
        departmentRepository.save(department);
    }

    public void updateDepartment(@Valid DepartmentDTO departmentDTO, Long id) {
        Department department = departmentRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Department not found with ID: " + id));
        department.setTitle(departmentDTO.getTitle().toUpperCase());
        departmentRepository.save(department);
    }
    
    public void deleteDepartment(Long id) {
        Department department = departmentRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Department not found"));

        for (Employee emp : department.getEmployee()) {
            emp.setDepartment(null);
        }

        departmentRepository.delete(department);
    }

}
