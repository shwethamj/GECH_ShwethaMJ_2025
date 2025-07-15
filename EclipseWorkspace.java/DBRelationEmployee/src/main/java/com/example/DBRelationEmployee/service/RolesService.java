package com.example.DBRelationEmployee.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.RolesDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.RolesRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;

@Service
public class RolesService {

    private final RolesRepository rolesRepository;

    public RolesService(RolesRepository rolesRepository) {
        this.rolesRepository = rolesRepository;
    }

    public void saveRole(RolesDTO roleDTO) {
        Roles role = new Roles();
        role.setRolename(roleDTO.getRolename().toUpperCase());
        rolesRepository.save(role);
    }

    public void updateRole(@Valid RolesDTO roleDTO, Long id) {
        Roles existingRole = rolesRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Role not found with ID: " + id));
        existingRole.setRolename(roleDTO.getRolename().toUpperCase());
        rolesRepository.save(existingRole);
    }

    public void deleteRole(Long id) {
        Roles role = rolesRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Role not found"));
        // Remove this role from all associated employees
        for (Employee employee : role.getEmployee()) {
            employee.getRoles().remove(role);
        }
        rolesRepository.delete(role);
    }

}
