package com.Studentform.StudentForm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.Studentform.StudentForm.dto.StudentDTO;
import com.Studentform.StudentForm.service.StudentService;

import jakarta.validation.Valid;


@Controller // for display html file which name is home.html
// for display the home(bcs it was given to return) only on screen we use @restController
public class StudentController {
	
	private final StudentService studentService;

	public StudentController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}


	@GetMapping({"" , "/"})
	public String home() {
		return "home";
	}
	
	
	@GetMapping("/add-student")
	public String AddStudent(Model model) {
		model.addAttribute("studentDTO",new StudentDTO()); 
		return "add_student";
	}
	
	@PostMapping("/add-student")
	public String AddStudent(@Valid @ModelAttribute StudentDTO studentDTO ,BindingResult result,Model model) {
		if(result.hasErrors()) {
			//model.addAttribute("studentDTO",new StudentDTO());
			return"add_student";
		}
		//System.out.println(studentDTO.getName()+"2");
		studentService.saveStudent(studentDTO);
		return "redirect:/";
		
	}

	
}
