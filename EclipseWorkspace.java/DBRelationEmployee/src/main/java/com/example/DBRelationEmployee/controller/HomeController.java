package com.example.DBRelationEmployee.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.EmployeeDTO;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.service.CustomEmployeeDetails;
import com.example.DBRelationEmployee.service.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class HomeController {
	
	private EmployeeService employeeService;
	private EmployeeRepository employeeRepo;
	
		
		public HomeController(EmployeeService employeeService, EmployeeRepository employeeRepo) {
		super();
		this.employeeService = employeeService;
		this.employeeRepo = employeeRepo;
	}

		@GetMapping("/dashboard")
		public String dashboard(HttpServletRequest request, Model model) {
		    String success_msg = (String) request.getSession().getAttribute("success");
		    if (success_msg != null) {
		        model.addAttribute("success", success_msg);
		        request.getSession().removeAttribute("success");
		    }

		    long userCount = employeeService.getUserCount();
		    model.addAttribute("userCount", userCount);

		    List<Employee> users = employeeService.getAllUsers();  // <-- Add this line
		    model.addAttribute("users", users);                     // <-- And this

		    return "dashboard";
		}

		
		@GetMapping({"","/"})
		public String home() {
			return "index";
		}
		@GetMapping("/login")
		public String login() {
		    return "login"; // Returns the view named "login.html"
		}
		
		@GetMapping("/register")
		public String registration(Model model) {
			System.out.println("1234567898765432123456");
			model.addAttribute("userDTO", new EmployeeDTO());
		    return "registration"; // Returns the view named "registeration.html"
		}
		
		@PostMapping("/register")
		public String register(@Validated @ModelAttribute EmployeeDTO userDTO, BindingResult result, RedirectAttributes attributes) {
			System.out.println("1111111111111111111");
			Optional<Employee> user = employeeRepo.findByEmail(userDTO.getEmail());
			if(user.isPresent()) {
				result.addError(
						new FieldError("UserDTO", "email", "Email is already registred")
						);
			}
			if(result.hasErrors()) {
				return "registration";
			}
			employeeService.saveUser(userDTO);
			attributes.addFlashAttribute("success", "Registration successfull. Please login");
			return "redirect:/login";
		}
		
		@GetMapping("/403")
		public String accessDenied() {
			return "403";
		}
		
		@GetMapping("/profile")
		public String profilePage(@AuthenticationPrincipal CustomEmployeeDetails userDetails, Model model) {
		    model.addAttribute("user", userDetails.getEmployee());
		    return "profile";
		}

	}

