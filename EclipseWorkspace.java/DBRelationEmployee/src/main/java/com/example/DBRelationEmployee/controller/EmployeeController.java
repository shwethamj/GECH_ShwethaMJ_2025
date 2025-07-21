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
import com.example.DBRelationEmployee.model.Roles;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.repository.RolesRepository;
import com.example.DBRelationEmployee.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	private EmployeeRepository userRepository;
	private EmployeeService authService;
	private RolesRepository roleRepository;
	
	
	public EmployeeController(EmployeeRepository userRepository, EmployeeService authService,
			RolesRepository roleRepository) {
		super();
		this.userRepository = userRepository;
		this.authService = authService;
		this.roleRepository = roleRepository;
	}


	@GetMapping({"/",""})
	public String users(Model model) {
		List<Employee> users= userRepository.findAll();
		model.addAttribute("users",users);
	    return "employee"; // Returns the view named "users.html"
	}



	@GetMapping("/add-user")
	public String addUser(Model model) {
		List<Roles> roles =  roleRepository.findAll();
		model.addAttribute("roles", roles);
		model.addAttribute("userDTO", new EmployeeDTO());
	    return "add-user"; // Returns the view named "users.html"
	}
	
	@PostMapping("/add-user")
	public String storeUser(@Validated @ModelAttribute EmployeeDTO userDTO, BindingResult result, Model model, RedirectAttributes attributes) {
		if(userDTO.getRoles().isEmpty()) {
			result.addError(
					new FieldError("UserDTO", "roles", "At least one role must be selected.")
					);
		}
		Optional<Employee> user = userRepository.findByEmail(userDTO.getEmail());
		if(user.isPresent()) {
			result.addError(
					new FieldError("UserDTO", "email", "Email is already registred")
					);
		}
		
		if(result.hasErrors()) {
			model.addAttribute("roles",roleRepository.findAll());
			return "add-user";
		}
		System.out.println(userDTO);
		authService.saveUser(userDTO);
		attributes.addFlashAttribute("success", "User saved successfully");
		return "redirect:/employee";
	}
	
	@GetMapping("/delete-user/{id}")
	public String deleteUser(@PathVariable Long id, RedirectAttributes attributes) {
		Optional<Employee> user =  userRepository.findById(id);
		if(user.isEmpty()) {
			attributes.addFlashAttribute("error","User with the is not present");
			return"redirect:/employee";
		}
		for(var role :user.get().getRoles()) {
			role.getEmployee().remove(user.get());
		}
		try {
			userRepository.delete(user.get());
		} catch (Exception e) {
			attributes.addFlashAttribute("error",e.getMessage());
	        return "redirect:/employee"; 
		}
		attributes.addFlashAttribute("success","User deleted successfully");
		return "redirect:/employee";
	}
	
	@GetMapping("/edit-user/{id}")
	public String editUser(@PathVariable Long id, Model model) {
	    Employee user = userRepository.findById(id)
	        .orElseThrow(() -> new UsernameNotFoundException("User not found"));

	    EmployeeDTO userDTO = new EmployeeDTO();
	    userDTO.setName(user.getName());
	    userDTO.setEmail(user.getEmail());
	    userDTO.setPassword(user.getPassword());

	    // ✅ Null-safe handling of Address
	    if (user.getAddress() != null) {
	        userDTO.setAddress(user.getAddress().getAddress());
	    } else {
	        userDTO.setAddress(""); // You can also set a message or skip this field
	    }

	    userDTO.setRoles(user.getRoles()
	        .stream()
	        .map(role -> role.getId())
	        .collect(Collectors.toSet()));

	    model.addAttribute("user", user);
	    model.addAttribute("userDTO", userDTO);
	    model.addAttribute("roles", roleRepository.findAll());

	    return "edit-user";
	}

	
	@PostMapping("/edit-user/{id}")
	public String updateUser(@PathVariable Long id ,@Validated @ModelAttribute EmployeeDTO userDTO, BindingResult result, Model model, RedirectAttributes attributes) {
		if(userDTO.getRoles().isEmpty()) {
			result.addError(
					new FieldError("UserDTO", "roles", "At least one role must be selected.")
					);
		}
		Optional<Employee> old_user = userRepository.findByEmail(userDTO.getEmail());
		if(old_user.isPresent() && !old_user.get().getId().equals(id)) {
			result.addError(
					new FieldError("UserDTO", "email", "Email is already registred")
					);
		}
		
		if(result.hasErrors()) {
			Employee user = userRepository.findById(id).get();
			model.addAttribute("user",user);
		    model.addAttribute("roles", roleRepository.findAll()); // to populate roles dropdown
			return "edit-user";
		}
		authService.updateUser(userDTO,id);
		attributes.addFlashAttribute("success","User updated successfully");
		return "redirect:/employee";
	}
	
}