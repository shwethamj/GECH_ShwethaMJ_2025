package com.SpringBootMVC_FormCrud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.SpringBootMVC_FormCrud.model.User;
import com.SpringBootMVC_FormCrud.service.UserService;

@Controller
public class HomeController {

	private UserService service;

	public HomeController(UserService service) {
		super();
		this.service = service;
	}
	
	@GetMapping({"","/"})
	public String home(Model model) {
		model.addAttribute("users", service.getAllStudent());
		return "home";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}
	
	@PostMapping("/add_user")
	public String add_student(@ModelAttribute User user) {
		service.saveStudent(user);
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String delete(Integer id) {
		service.deleteUser(id);
		return "redirect:/";
	}
	
	@GetMapping("/edit")
	public String edit(Integer id,Model model) {
	User user = service.getUserById(id);
	model.addAttribute("user", user);
	return "edit";
	}
	
	@PostMapping("/update")
	public String update(@RequestParam Integer id,@ModelAttribute User user) {
		User us= service.getUserById(id);
		us.setName(user.getName());
		us.setEmail(user.getEmail());
		us.setPassword(user.getPassword());
		
		service.saveStudent(us);
		return "redirect:/";
	}
}
