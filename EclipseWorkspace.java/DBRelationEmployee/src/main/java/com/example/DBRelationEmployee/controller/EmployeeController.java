package com.example.DBRelationEmployee.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.RolesRepository;
import com.example.DBRelationEmployee.service.EmployeeService;


@Controller
public class EmployeeController {

    private final EmployeeRepository employeeRepository;
    private final EmployeeService employeeService;
    private final RolesRepository rolesRepository;

    public EmployeeController(EmployeeRepository employeeRepository,
                              EmployeeService employeeService,
                              RolesRepository rolesRepository) {
        this.employeeRepository = employeeRepository;
        this.employeeService = employeeService;
        this.rolesRepository = rolesRepository;
    }

    @GetMapping("/employee")
    public String employees(Model model) {
        List<Employee> employees = employeeRepository.findAll();
        model.addAttribute("employees", employees);
        return "employees"; // View: employees.html
    }

    @GetMapping("/add")
    public String addEmployee(Model model) {
        model.addAttribute("employeeDTO", new EmployeeDTO());
        model.addAttribute("roles", rolesRepository.findAll());
        return "add-employee"; // View: add-employee.html
    }

    @PostMapping("/add")
    public String storeEmployee(@Validated @ModelAttribute EmployeeDTO employeeDTO,
                                BindingResult result,
                                Model model,
                                RedirectAttributes attributes) {

        if (employeeDTO.getRoles().isEmpty()) {
            result.addError(new FieldError("employeeDTO", "roles", "At least one role must be selected."));
        }

        Optional<Employee> existing = employeeRepository.findByEmail(employeeDTO.getEmail());
        if (existing.isPresent()) {
            result.addError(new FieldError("employeeDTO", "email", "Email is already registered"));
        }

        if (result.hasErrors()) {
            model.addAttribute("roles", rolesRepository.findAll());
            return "add-employee";
        }

        employeeService.saveEmployee(employeeDTO);
        attributes.addFlashAttribute("success", "Employee added successfully");
        return "redirect:/employees";
    }

    @GetMapping("/edit/{id}")
    public String editEmployee(@PathVariable Long id, Model model) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("Employee not found"));

        EmployeeDTO dto = new EmployeeDTO();
        dto.setName(employee.getName());
        dto.setEmail(employee.getEmail());
        dto.setPassword(employee.getPassword());
        dto.setAddress(employee.getAddress() != null ? employee.getAddress().getAddress() : null);
        dto.setRoles(employee.getRoles().stream().map(r -> r.getId()).collect(Collectors.toSet()));
        dto.setDepartmentId(employee.getDepartment() != null ? employee.getDepartment().getId() : null);

        model.addAttribute("employeeDTO", dto);
        model.addAttribute("employee", employee);
        model.addAttribute("roles", rolesRepository.findAll());
        return "edit-employee"; // View: edit-employee.html
    }

    @PostMapping("/edit/{id}")
    public String updateEmployee(@PathVariable Long id,
                                 @Validated @ModelAttribute EmployeeDTO employeeDTO,
                                 BindingResult result,
                                 Model model,
                                 RedirectAttributes attributes) {

        Optional<Employee> old = employeeRepository.findByEmail(employeeDTO.getEmail());
        if (old.isPresent() && !old.get().getId().equals(id)) {
            result.addError(new FieldError("employeeDTO", "email", "Email is already registered"));
        }

        if (employeeDTO.getRoles().isEmpty()) {
            result.addError(new FieldError("employeeDTO", "roles", "At least one role must be selected."));
        }

        if (result.hasErrors()) {
            Employee employee = employeeRepository.findById(id).get();
            model.addAttribute("employee", employee);
            model.addAttribute("roles", rolesRepository.findAll());
            return "edit-employee";
        }

        employeeService.updateEmployee(employeeDTO, id);
        attributes.addFlashAttribute("success", "Employee updated successfully");
        return "redirect:/employees";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Long id, RedirectAttributes attributes) {
        Optional<Employee> employee = employeeRepository.findById(id);
        if (employee.isEmpty()) {
            attributes.addFlashAttribute("error", "Employee not found");
            return "redirect:/employees";
        }

        for (var role : employee.get().getRoles()) {
            role.getEmployee().remove(employee.get());
        }

        try {
            employeeRepository.delete(employee.get());
            attributes.addFlashAttribute("success", "Employee deleted successfully");
        } catch (Exception e) {
            attributes.addFlashAttribute("error", "Error deleting employee: " + e.getMessage());
        }

        return "redirect:/employees";
    }
}
