package com.example.RestAPICrud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.RestAPICrud.service.StudentService;

@Controller
public class StudentController {

	private StudentService studentService;
	
	  public StudentController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}

	@GetMapping("/std_details")
	    public String showStudentDetailsPage(Model model) {
	        return "std_details"; // this looks for std_details.html in /templates
	    }
}
