package com.example.DBRelationEmployee.service;


import org.springframework.stereotype.Service;

import com.example.DBRelationEmployee.DTO.RolesDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.RolesRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;

@Service
public class RolesService {
	
	private RolesRepository roleRepository;
	

	public RolesService(RolesRepository roleRepository) {
		super();
		this.roleRepository = roleRepository;
	}



	public void saveRole(RolesDTO roleDTO) {
		Roles role = new Roles();
		String roleName = roleDTO.getRolename().toUpperCase();
		if (!roleName.startsWith("ROLE_")) {
		    roleName = "ROLE_" + roleName;
		}
		role.setRolename(roleName);
		roleRepository.save(role);

		roleRepository.save(role);
	}
	

	public void updateRole(@Valid RolesDTO roleDTO, Long id) {
		System.out.println("id: "+id);
	    Roles existingRole = roleRepository.findById(id)
	        .orElseThrow(() -> new EntityNotFoundException("Role not found with ID: " + id));
	    System.out.println(existingRole+"----- exist");
	    System.out.println("roledto"+ roleDTO);
	    existingRole.setRolename(roleDTO.getRolename().toUpperCase());
	    roleRepository.save(existingRole);
	}



	public void deleteRole(Long id) {
		Roles role = roleRepository.findById(id)
		        .orElseThrow(() -> new EntityNotFoundException("Role not found"));
	    // Remove the role from all users
		for( Employee user : role.getEmployee()) {
			user.getRoles().remove(role);
		}
	    roleRepository.delete(role);
	}

}
