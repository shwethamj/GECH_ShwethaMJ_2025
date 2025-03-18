package gec_crud.SpringBootCRUD.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import gec_crud.SpringBootCRUD.service.StudentService;
import gec_crud.SpringBootCRUD.dto.StudentDto;
import gec_crud.SpringBootCRUD.models.Student;


@Controller


public class HomeController {
	private final StudentService studentService;
	

	public HomeController(StudentService studentService) {
		super();
		this.studentService = studentService;
	}


	@GetMapping({"","/"})
	public String getAllStudents(Model model) {
		List<Student>students=studentService.getAllStudents();
		model.addAttribute("students",students);
		return "Student";
	}
	@GetMapping("/addStudent")
	public String addStudent(Model model) {
		StudentDto studentDto=new StudentDto();
		model.addAttribute("studentDto",studentDto);
		return "addStudent";
	}
	
	@PostMapping("/addStudent")
	public String saveStudent(@ModelAttribute StudentDto studentDto) {
		studentService.saveStudent(studentDto);
		return "redirect:/";
	}
	
	@GetMapping("/edit-student")
	public String getStudent(@RequestParam Long id,Model model) {
		Student student =studentService.getStudent(id);
		StudentDto studentDto = new StudentDto();
		studentDto.setFname(student.getFname());
		studentDto.setLname(student.getLname());
		studentDto.setEmail(student.getEmail());
		studentDto.setPhone(student.getPhone());
		studentDto.setAddress(student.getAddress());
		model.addAttribute("studentDto",studentDto); // form fields
		model.addAttribute("student",student); // for id
		return "edit-student";
	}
	@PostMapping("/edit-student")
	public String updateStudent(@ModelAttribute StudentDto studentDto, @RequestParam Long id) {
		studentService.updateStudent(studentDto, id);
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String deleteStudent(@RequestParam Long id) {
		studentService.deleteStudent(id);
		return "redirect:/";
	}
	
	

}
