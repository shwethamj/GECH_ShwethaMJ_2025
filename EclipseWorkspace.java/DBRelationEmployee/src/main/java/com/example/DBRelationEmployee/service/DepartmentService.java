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

	public void saveNotes(@Valid DepartmentDTO notesDTO, Employee user) {
	Department notes = new Department();
		notes.setTitle(notesDTO.getTitle().toUpperCase());
		notes.setDescription(notesDTO.getDescription());
		departmentRepository.save(notes);
	}


	public void updateNotes(@Valid DepartmentDTO notesDTO, Long id) {
		Department notes = departmentRepository.findById(id).get();
		notes.setTitle(notesDTO.getTitle().toUpperCase());
		notes.setDescription(notesDTO.getDescription());
		departmentRepository.save(notes);
	}
}
