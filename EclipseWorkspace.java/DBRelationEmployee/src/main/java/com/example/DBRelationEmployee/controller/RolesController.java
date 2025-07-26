package com.example.DBRelationEmployee.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.RolesDTO;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.RolesRepository;
import com.example.DBRelationEmployee.service.RolesService;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/roles")
public class RolesController {
	
	private RolesRepository roleRepository;
	private RolesService roleService;
	
	
	public RolesController(RolesRepository roleRepository, RolesService roleService) {
		super();
		this.roleRepository = roleRepository;
		this.roleService = roleService;
	}

	@GetMapping({"/",""})
	public String roles(Model model) {
		List<Roles> roles = roleRepository.findAll();
		model.addAttribute("roles",roles);
	    return "roles"; // Returns the view named "roles.html"
	}
	@GetMapping("/add-role")
	public String addRoleForm(Model model) {
	    model.addAttribute("rolesDTO", new RolesDTO());
	    return "add-role";
	}

	@PostMapping("/add-role")
	public String saveRole(@Valid @ModelAttribute("rolesDTO") RolesDTO rolesDTO,
	                       BindingResult result,
	                       Model model,
	                       RedirectAttributes attributes) {

	    Optional<Roles> existingRole = roleRepository.findByRolename(rolesDTO.getRolename().toUpperCase());
	    if (existingRole.isPresent()) {
	        result.addError(new FieldError("rolesDTO", "rolename", "Role with given name is already present."));
	    }

	    if (result.hasErrors()) {
	        return "add-role";
	    }
	    roleService.saveRole(rolesDTO);
	    attributes.addFlashAttribute("success", "Role Saved Successfully");
	    return "redirect:/roles";
	}

	@GetMapping("/edit-role/{id}")
	public String editRole(@PathVariable Long id, Model model, RedirectAttributes attributes) {
		Optional<Roles> role =  roleRepository.findById(id);
		if(role.isEmpty()) {
			attributes.addAttribute("error","Role with given id notpresent");
			return "redirect:/roles";
		}
		RolesDTO roleDTO = new RolesDTO();
		roleDTO.setRolename(role.get().getRolename());
		model.addAttribute("role",role.get());
		model.addAttribute("roleDTO",roleDTO);
		return "edit-role";
	}
	
	@PostMapping("/edit-role/{id}")
	public String editRole(@Valid @ModelAttribute RolesDTO roleDTO, @PathVariable Long id, BindingResult result, RedirectAttributes attributes, Model model) {
		Optional<Roles> role = roleRepository.findByRolename(roleDTO.getRolename().toUpperCase());
		if(role.isPresent() && !role.get().getId().equals(id)) {
			System.out.println(role.get()+" "+id);
			result.addError(
					new FieldError("RoleDTO", "name", "Role with given name is already present")
					);
		}
		if(result.hasErrors()) {
			Optional<Roles> existing_role = roleRepository.findById(id);
			model.addAttribute("role",existing_role.get());
			return "edit-role";
		}
		try {
			roleService.updateRole(roleDTO, id);
		} catch (EntityNotFoundException ex) {
			attributes.addFlashAttribute("error",ex.getMessage());
	        return "redirect:/roles"; 
	    }
		attributes.addFlashAttribute("success","Role Updated Successfully");
		return "redirect:/roles";
	}	
	@GetMapping("/delete-role/{id}")
	public String deleteRole(@PathVariable Long id, RedirectAttributes attributes) {
		 Optional<Roles> role = roleRepository.findById(id);
		 if(role.isPresent()) {
			 try {
				 	roleService.deleteRole(id);
				} 
			 catch (EntityNotFoundException ex) {
					attributes.addFlashAttribute("error",ex.getMessage());
			        return "redirect:/roles"; 
			 }
		 }
		 else {
			attributes.addFlashAttribute("error","Role with id is not present");
			return "redirect:/roles";
		 }
		attributes.addFlashAttribute("success","Role deleted successfully.");
		return "redirect:/roles";
	}
}