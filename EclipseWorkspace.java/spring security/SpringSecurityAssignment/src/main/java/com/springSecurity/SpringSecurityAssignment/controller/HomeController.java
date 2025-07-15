package com.springSecurity.SpringSecurityAssignment.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springSecurity.SpringSecurityAssignment.DTO.StudentDTO;
import com.springSecurity.SpringSecurityAssignment.DTO.UserDTO;
import com.springSecurity.SpringSecurityAssignment.model.Student;
import com.springSecurity.SpringSecurityAssignment.model.User;
import com.springSecurity.SpringSecurityAssignment.repository.StudentRepository;
import com.springSecurity.SpringSecurityAssignment.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomeController {
	
	
	private UserService userService;
	private StudentRepository studentRepository;
	
	

	public HomeController(UserService userService, StudentRepository studentRepository) {
		super();
		this.userService = userService;
		this.studentRepository = studentRepository;
	}

	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
	    model.addAttribute("user", new UserDTO());
	    return "register";
	}

	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") UserDTO userDTO,
	                       BindingResult result,
	                       RedirectAttributes redirectAttributes,
	                       Model model) {

	    // Check for validation errors
	    if (result.hasErrors()) {
	        return "register"; // go back to form if validation fails
	    }

	    try {
	        userService.storeUser(userDTO);
	        redirectAttributes.addFlashAttribute("success", "Student saved successfully");
	    } catch (Exception e) {
	        model.addAttribute("error", "Failed to send email");
	        return "register";
	    }

	    return "redirect:/login";
	}


	@GetMapping("/std_details")
	public String viewStudents(Model model) {
	    List<Student> students = userService.getAllStudent();
	    model.addAttribute("students", students); // Not "user"
	    return "std_details"; // Ensure the HTML file is named "student-details.html"
	}


	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/add-student")
	public String addStudent(Model model) {
	    model.addAttribute("studentDTO", new StudentDTO());
	    return "add_student";
	}
	
	@PostMapping("/add-student")
	public String saveStudent(@Valid @ModelAttribute("studentDTO") StudentDTO studentDTO,
	                          BindingResult result,
	                          RedirectAttributes attributes) {
	    Student existing = studentRepository.findByEmail(studentDTO.getEmail());
	    if (existing != null) {
	        result.addError(new FieldError("studentDTO", "email", "Email is already taken"));
	    }

	    if (result.hasErrors()) {
	        return "add_student";
	    }

	    userService.saveStudent(studentDTO);
	    attributes.addFlashAttribute("success", "Student added successfully");
	    return "redirect:/std_details";
	}

    // Delete Student
    @GetMapping("/delete")
    public String deleteStudent(@RequestParam Long id, RedirectAttributes attributes) {
        userService.deleteStudent(id);
        attributes.addFlashAttribute("success", "Student deleted successfully");
        return "redirect:/";
    }

    // Show Edit Form
    @GetMapping("/edit")
    public String editStudent(@RequestParam Long id, Model model) {
        StudentDTO studentDTO = userService.getStudentById(id);
        model.addAttribute("studentDTO", studentDTO);
        model.addAttribute("id", id); // ✅ add separately
        return "edit_student";
    }


    // Handle Edit Submission
    @PostMapping("/edit")
    public String updateStudent(@Valid @ModelAttribute("studentDTO") StudentDTO studentDTO,
                                BindingResult result,
                                @RequestParam Long id,
                                RedirectAttributes attributes) {

        if (result.hasErrors()) {
            return "edit_student";
        }

        userService.updateStudent(studentDTO, id);
        attributes.addFlashAttribute("success", "Student updated successfully");
        return "redirect:/std_details"; // Updated the redirect to go to std_details
    }
}
