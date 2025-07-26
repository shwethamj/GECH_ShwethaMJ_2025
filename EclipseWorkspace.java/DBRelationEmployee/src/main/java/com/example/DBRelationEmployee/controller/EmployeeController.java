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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Address;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.AddressRepository;
import com.example.DBRelationEmployee.repository.DepartmentRepository;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.RolesRepository;
import com.example.DBRelationEmployee.service.EmployeeService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    private final EmployeeRepository userRepository;
    private final EmployeeService authService;
    private final RolesRepository roleRepository;
    private final DepartmentRepository departmentRepository;
    private AddressRepository addressRepository;


    public EmployeeController(EmployeeRepository userRepository, EmployeeService authService,
			RolesRepository roleRepository, DepartmentRepository departmentRepository,
			AddressRepository addressRepository) {
		super();
		this.userRepository = userRepository;
		this.authService = authService;
		this.roleRepository = roleRepository;
		this.departmentRepository = departmentRepository;
		this.addressRepository = addressRepository;
	}

	@GetMapping({"/", ""})
    public String users(Model model) {
        List<Employee> users = userRepository.findAll();
     // DEBUGGING: Print to check address comes properly
        users.forEach(u -> {
            System.out.println("User: " + u.getName() + ", Address: " +
                (u.getAddress() != null ? u.getAddress().getAddress() : "null"));
        });
        model.addAttribute("users", users);
        return "employee";
    }

	@GetMapping("/add-user")
	public String addUser(Model model) {
	    model.addAttribute("userDTO", new EmployeeDTO());
	    model.addAttribute("roles", roleRepository.findAll());
	    model.addAttribute("departments", departmentRepository.findAll());
	    model.addAttribute("addresses", addressRepository.findAll()
	            .stream()
	            .map(Address::getAddress)
	            .distinct()
	            .collect(Collectors.toList()));
	    return "add-user";
	}

	@PostMapping("/add-user")
	public String storeUser(@Valid @ModelAttribute("userDTO") EmployeeDTO userDTO,
	                        BindingResult result,
	                        Model model,
	                        RedirectAttributes attributes) {

	    // Validate roles
	    if (userDTO.getRoles() == null || userDTO.getRoles().isEmpty()) {
	        result.addError(new FieldError("userDTO", "roles", "At least one role must be selected."));
	    }

	    // Validate email uniqueness
	    Optional<Employee> user = userRepository.findByEmail(userDTO.getEmail());
	    if (user.isPresent()) {
	        result.addError(new FieldError("userDTO", "email", "Email is already registered"));
	    }

	    // If validation fails, re-populate model attributes and return form
	    if (result.hasErrors()) {
	        model.addAttribute("roles", roleRepository.findAll());
	        model.addAttribute("departments", departmentRepository.findAll());

	        // ✅ Add this line to reload addresses if needed in the form
	        model.addAttribute("addresses", addressRepository.findAll()
	                .stream()
	                .map(a -> a.getAddress())
	                .distinct()
	                .toList());

	        return "add-user";
	    }

	    // Save user if no errors
	    authService.saveUser(userDTO);
	    attributes.addFlashAttribute("success", "User saved successfully");

	    return "redirect:/employee/";
	}


    @GetMapping("/edit-user/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        Employee user = userRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        EmployeeDTO userDTO = new EmployeeDTO();
        userDTO.setName(user.getName());
        userDTO.setEmail(user.getEmail());
        userDTO.setPassword(user.getPassword());

        // ✅ FIX: Include address if available
        if (user.getAddress() != null) {
            userDTO.setAddress(user.getAddress().getAddress());
        }

        if (user.getDepartment() != null) {
            userDTO.setDepartmentId(user.getDepartment().getId());
        }

        userDTO.setRoles(user.getRoles().stream()
                .map(Roles::getId)
                .collect(Collectors.toSet()));
       
        model.addAttribute("user", user); // only for ID
        model.addAttribute("userDTO", userDTO);
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("departments", departmentRepository.findAll());
        return "edit-user";
    }

    @PostMapping("/edit-user/{id}")
    public String updateUser(@PathVariable Long id,
                             @Validated @ModelAttribute("userDTO") EmployeeDTO userDTO,
                             BindingResult result,
                             Model model,
                             RedirectAttributes attributes) {

        if (userDTO.getRoles() == null || userDTO.getRoles().isEmpty()) {
            result.addError(new FieldError("userDTO", "roles", "At least one role must be selected."));
        }

        Optional<Employee> existingUser = userRepository.findByEmail(userDTO.getEmail());
        if (existingUser.isPresent() && !existingUser.get().getId().equals(id)) {
            result.addError(new FieldError("userDTO", "email", "Email is already registered"));
        }

        if (result.hasErrors()) {
            Employee user = userRepository.findById(id).orElseThrow();
            model.addAttribute("user", user);
            model.addAttribute("roles", roleRepository.findAll());
            model.addAttribute("departments", departmentRepository.findAll());
            model.addAttribute("addresses", addressRepository.findAll()
                    .stream()
                    .map(Address::getAddress)
                    .distinct()
                    .collect(Collectors.toList()));
            userDTO.setPassword(""); // Clear for security
            return "edit-user";
        }

        authService.updateUser(userDTO, id);
        attributes.addFlashAttribute("success", "User updated successfully");
        return "redirect:/employee";
    }


    @GetMapping("/delete-user/{id}")
    public String deleteUser(@PathVariable Long id, RedirectAttributes attributes) {
        Optional<Employee> user = userRepository.findById(id);
        if (user.isEmpty()) {
            attributes.addFlashAttribute("error", "User not found");
            return "redirect:/employee";
        }

        for (var role : user.get().getRoles()) {
            role.getEmployee().remove(user.get());
        }

        try {
            userRepository.delete(user.get());
        } catch (Exception e) {
            attributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/employee";
        }

        attributes.addFlashAttribute("success", "User deleted successfully");
        return "redirect:/employee";
    }
}
