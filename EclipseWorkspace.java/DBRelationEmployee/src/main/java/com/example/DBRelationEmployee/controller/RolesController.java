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

    private final RolesRepository roleRepository;
    private final RolesService roleService;

    public RolesController(RolesRepository roleRepository, RolesService roleService) {
        this.roleRepository = roleRepository;
        this.roleService = roleService;
    }

    @GetMapping({"", "/"})
    public String listRoles(Model model) {
        List<Roles> roles = roleRepository.findAll();
        model.addAttribute("roles", roles);
        return "roles"; // roles.html
    }

    @GetMapping("/add-role")
    public String showAddForm(Model model) {
        model.addAttribute("roleDTO", new RolesDTO());
        return "add-role";
    }

    @PostMapping("/add-role")
    public String saveRole(@Valid @ModelAttribute RolesDTO roleDTO,
                           BindingResult result,
                           RedirectAttributes attributes) {
        Optional<Roles> existing = roleRepository.findByRolename(roleDTO.getRolename().toUpperCase());
        if (existing.isPresent()) {
            result.addError(new FieldError("RoleDTO", "name", "Role with given name already exists"));
        }

        if (result.hasErrors()) {
            return "add-role";
        }

        roleService.saveRole(roleDTO);
        attributes.addFlashAttribute("success", "Role saved successfully");
        return "redirect:/roles";
    }

    @GetMapping("/edit-role/{id}")
    public String showEditForm(@PathVariable Long id,
                               Model model,
                               RedirectAttributes attributes) {
        Optional<Roles> role = roleRepository.findById(id);
        if (role.isEmpty()) {
            attributes.addFlashAttribute("error", "Role with ID not found");
            return "redirect:/roles";
        }

        RolesDTO roleDTO = new RolesDTO();
        roleDTO.setRolename(role.get().getRolename());

        model.addAttribute("role", role.get());
        model.addAttribute("roleDTO", roleDTO);
        return "edit-role";
    }

    @PostMapping("/edit-role/{id}")
    public String updateRole(@PathVariable Long id,
                             @Valid @ModelAttribute RolesDTO roleDTO,
                             BindingResult result,
                             RedirectAttributes attributes,
                             Model model) {

    	Optional<Roles> existing = roleRepository.findByRolename(roleDTO.getRolename().toUpperCase());
    	if (existing.isPresent() && existing.get().getId() != id) {
    	    result.addError(new FieldError("rolesDTO", "rolename", "Role with given name already exists"));
    	}

        if (result.hasErrors()) {
            model.addAttribute("role", roleRepository.findById(id).orElse(null));
            model.addAttribute("roleDTO", roleDTO); // Preserve form data on error
            return "edit-role";
        }

        try {
            roleService.updateRole(roleDTO, id);
            attributes.addFlashAttribute("success", "Role updated successfully");
        } catch (EntityNotFoundException ex) {
            attributes.addFlashAttribute("error", ex.getMessage());
        }

        return "redirect:/roles";
    }


    @GetMapping("/delete-role/{id}")
    public String deleteRole(@PathVariable Long id,
                             RedirectAttributes attributes) {
        try {
            roleService.deleteRole(id);
            attributes.addFlashAttribute("success", "Role deleted successfully");
        } catch (EntityNotFoundException ex) {
            attributes.addFlashAttribute("error", ex.getMessage());
        }
        return "redirect:/roles";
    }
}
