package com.springbootSecurityDemo.springbootSecurityDemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbootSecurityDemo.springbootSecurityDemo.DTO.StudentDTO;
import com.springbootSecurityDemo.springbootSecurityDemo.service.StudentService;


@Controller
public class HomeController {
	
	private StudentService studentService;
	

	public HomeController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}

	@GetMapping({"/","/home"})
	public String home() {
		return "home";
	}
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		StudentDTO studentDTO = new StudentDTO();
		model.addAttribute("studentDTO",studentDTO);
		return "register";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute StudentDTO studentDTO , RedirectAttributes redirectAttributes) {
		studentService.storeStudent(studentDTO);
		redirectAttributes.addFlashAttribute("success","student saved succefully");
		return "redirect:/";
	}
	
}

