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

import com.example.DBRelationEmployee.DTO.DepartmentDTO;
import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.repository.DepartmentRepository;
import com.example.DBRelationEmployee.service.DepartmentService;

import jakarta.validation.Valid;

@Controller

public class DepartmentController {

    private final DepartmentRepository departmentRepository;
    private final DepartmentService departmentService;

    public DepartmentController(DepartmentRepository departmentRepository, DepartmentService departmentService) {
        this.departmentRepository = departmentRepository;
        this.departmentService = departmentService;
    }

    @GetMapping("/department")
    public String listDepartments(Model model) {
        List<Department> departments = departmentRepository.findAll();
        model.addAttribute("departments", departments);
        return "departments";
    }

    @GetMapping("/add-department")
    public String addDepartmentForm(Model model) {
        model.addAttribute("departmentDTO", new DepartmentDTO());
        return "add-department";
    }

    @PostMapping("/add-department")
    public String saveDepartment(@Valid @ModelAttribute DepartmentDTO departmentDTO,
                                 BindingResult result,
                                 RedirectAttributes attributes) {

        Optional<Department> existing = departmentRepository.findByTitle(departmentDTO.getTitle().toUpperCase());
        if (existing.isPresent()) {
            result.addError(new FieldError("departmentDTO", "title", "Department with this name already exists."));
        }

        if (result.hasErrors()) {
            return "add-department";
        }

        departmentService.saveDepartment(departmentDTO);
        attributes.addFlashAttribute("success", "Department added successfully.");
        return "redirect:/departments";
    }

    @GetMapping("/edit-department/{id}")
    public String editDepartmentForm(@PathVariable Long id, Model model, RedirectAttributes attributes) {
        Optional<Department> department = departmentRepository.findById(id);
        if (department.isEmpty()) {
            attributes.addFlashAttribute("error", "Department not found.");
            return "redirect:/departments";
        }

        DepartmentDTO departmentDTO = new DepartmentDTO();
        departmentDTO.setTitle(department.get().getTitle());

        model.addAttribute("department", department.get());
        model.addAttribute("departmentDTO", departmentDTO);
        return "edit-department";
    }

    @PostMapping("/edit-department/{id}")
    public String updateDepartment(@PathVariable Long id,
                                   @Valid @ModelAttribute DepartmentDTO departmentDTO,
                                   BindingResult result,
                                   RedirectAttributes attributes,
                                   Model model) {

        Optional<Department> existing = departmentRepository.findByTitle(departmentDTO.getTitle().toUpperCase());
        if (existing.isPresent() && existing.get().getId() != id) {
            result.addError(new FieldError("departmentDTO", "title", "Department name already in use."));
        }

        if (result.hasErrors()) {
            model.addAttribute("department", departmentRepository.findById(id).orElse(null));
            return "edit-department";
        }

        departmentService.updateDepartment(departmentDTO, id);
        attributes.addFlashAttribute("success", "Department updated successfully.");
        return "redirect:/departments";
    }

    @GetMapping("/delete-department/{id}")
    public String deleteDepartment(@PathVariable Long id, RedirectAttributes attributes) {
        Optional<Department> department = departmentRepository.findById(id);
        if (department.isEmpty()) {
            attributes.addFlashAttribute("error", "Department not found.");
            return "redirect:/departments";
        }

        try {
            departmentService.deleteDepartment(id);
            attributes.addFlashAttribute("success", "Department deleted successfully.");
        } catch (Exception e) {
            attributes.addFlashAttribute("error", "Error deleting department: " + e.getMessage());
        }

        return "redirect:/departments";
    }
}
