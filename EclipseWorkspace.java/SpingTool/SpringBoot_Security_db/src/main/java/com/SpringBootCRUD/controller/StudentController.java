package com.SpringBootCRUD.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.SpringBootCRUD.model.Student;
import com.SpringBootCRUD.service.StudentService;


@Controller
public class StudentController {
   
	private final StudentService studentService;

	public StudentController(StudentService studentService) {
		super();
		this.studentService = studentService;	
	}
	
	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("students",studentService.getAllStudents());
		return "index";
	}
	
	@GetMapping("/")
	public String home(Model model) {
		return "home";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		return "about";
	}
	
	@GetMapping("/contact")
	public String contact(Model model) {
		return "contact";
	}
	
	@GetMapping("/add")
	public String AddStudent(Model model){
		model.addAttribute("student",new Student());
		return "addStudent";
	}
	
	@PostMapping("/save")
	public String saveStudent(@ModelAttribute Student student) {
		studentService.saveStudent(student);
		return "redirect:/";
	}
	
	@GetMapping("/edit/{id}")
	public String editStudent(@PathVariable Long id ,Model model) {
		Student student = studentService.getStudentById(id);
		model.addAttribute("student",student);
		return "edit_student";
	}
	
	@PostMapping("/update/{id}")
	public String upadateStudent(@PathVariable long id,@ModelAttribute("student") Student student) {
		Student std = studentService.getStudentById(id);
		std.setName(student.getName());
		std.setAge(student.getAge());
		std.setEmail(student.getEmail());
		
		studentService.saveStudent(std);
		return "redirect:/";
	}
	
	@GetMapping("delete/{id}")
	public String deleteStudent(@PathVariable Long id) {
		studentService.deleteStudent(id);
		return "redirect:/";
	}
}
