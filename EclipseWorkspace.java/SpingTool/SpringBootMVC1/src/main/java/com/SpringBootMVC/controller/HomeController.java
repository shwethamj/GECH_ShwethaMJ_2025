package com.SpringBootMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.SpringBootMVC.service.UserService;


@Controller
public class HomeController {
	
	private UserService service;
	
	

	public HomeController(UserService service) {
		super();
		this.service = service;
	}

	@GetMapping({" ","/"})
	public String home(Model model) {
		model.addAttribute("users",service.getAllStudents());
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
}
