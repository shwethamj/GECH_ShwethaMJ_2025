package com.Studentform.StudentForm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Studentform.StudentForm.dto.StudentDTO;
import com.Studentform.StudentForm.models.StudentForm;
import com.Studentform.StudentForm.repository.StudentRepository;
import com.Studentform.StudentForm.service.StudentService;


import jakarta.validation.Valid;


@Controller // for display html file which name is home.html
// for display the home(bcs it was given to return) only on screen we use @restController
public class StudentController {
	
	private final StudentService studentService;
	private final StudentRepository studentRepository;

	public StudentController(StudentService studentService, StudentRepository studentRepository) {
		super();
		this.studentService = studentService;
		this.studentRepository = studentRepository;
	}


	@GetMapping({"" , "/"})
	public String home(Model model) {
		List<StudentForm> students = studentService.getAllStudents(); // getAllStudents is method created in the service
		model.addAttribute("students",students); // students id=s object name
		
		return "home";
	}
	
	
	@GetMapping("/add-student")
	public String AddStudent(Model model) {
		model.addAttribute("studentDTO",new StudentDTO()); 
		return "add_student";
	}
	
	@PostMapping("/add-student")
	public String AddStudent(@Valid @ModelAttribute StudentDTO studentDTO ,BindingResult result,Model model,RedirectAttributes attributes) {
		if(result.hasErrors()) {
			//model.addAttribute("studentDTO",new StudentDTO());
			return"add_student";
		}
		//System.out.println(studentDTO.getName()+"2");
		studentService.saveStudent(studentDTO);
		attributes.addFlashAttribute("success","student added succesfully");
		return "redirect:/";
		
	}

	
	@GetMapping("/delete")
	public String  deleteStudent(@RequestParam Long id,RedirectAttributes attributes) {
		studentService.deleteStudent(id);
		attributes.addFlashAttribute("success","student deleted succesfully");
		return "redirect:/";
		
	}
	@GetMapping("/edit")
	public String editStudent(@RequestParam Long id,Model model) {
		StudentDTO studentDTO = studentService.editStudent(id);
		StudentForm student =studentRepository.findById(id).get(); // get is optional
		model.addAttribute("studentDTO",studentDTO);
		model.addAttribute("student",student);
		return "edit_student";
		
	}
	
	@PostMapping("/edit")
	public String updateStudent(@Valid @ModelAttribute StudentDTO studentDTO ,BindingResult result, @RequestParam Long id,Model model,RedirectAttributes attributes) {	 
		if(result.hasErrors()) {
			StudentForm student = studentRepository.findById(id).get();
			model.addAttribute("student", student);
			return "edit_student";
			
		}
		
		studentService.updateStudent(studentDTO,id);
		attributes.addFlashAttribute("success","student data edited succesfully");
		return "redirect:/";
		
	}
	
}
