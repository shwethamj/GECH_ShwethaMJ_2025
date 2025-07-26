package com.example.DBRelationEmployee.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.DepartmentDTO;
import com.example.DBRelationEmployee.model.Department;
import com.example.DBRelationEmployee.model.Employee;
import com.example.DBRelationEmployee.repository.DepartmentRepository;
import com.example.DBRelationEmployee.repository.EmployeeRepository;
import com.example.DBRelationEmployee.service.DepartmentService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/notes")
public class DepartmentController {

	private DepartmentRepository notesRepository;
	private EmployeeRepository userRepository;
	private DepartmentService notesService;

	public DepartmentController(DepartmentRepository notesRepository, EmployeeRepository userRepository,
			DepartmentService notesService) {
		super();
		this.notesRepository = notesRepository;
		this.userRepository = userRepository;
		this.notesService = notesService;
	}

	@GetMapping({"/", ""})
	public String notes(Model model, @AuthenticationPrincipal UserDetails userDetails) {
	    if (userDetails == null) {
	        throw new UsernameNotFoundException("User is not authenticated");
	    }

	    var authorities = userDetails.getAuthorities();
	    if (authorities.stream().anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"))) {
	        List<Department> notes = notesRepository.findAll();
	        model.addAttribute("notes", notes);
	    } else {
	        Employee user = userRepository.findByEmail(userDetails.getUsername())
	            .orElseThrow(() -> new UsernameNotFoundException("User not found"));
	        List<Department> notes = notesRepository.findByEmployee(user);
	        model.addAttribute("notes", notes);
	    }
	    return "notes";
	}

	@GetMapping("/add-note")
	
	public String addNote(Model model) {
		model.addAttribute("noteDTO", new DepartmentDTO());
		return "add-notes";
	}

	@PostMapping("/add-note")
	public String addNote(@Valid @ModelAttribute DepartmentDTO notesDTO, BindingResult result, Model model,
			RedirectAttributes attributes, @AuthenticationPrincipal UserDetails userDetails) {
		if (result.hasErrors()) {
			return "add-notes";
		}
		String email = userDetails.getUsername();
	Employee user = userRepository.findByEmail(email).orElseThrow(()-> new UsernameNotFoundException("User not found"));
		notesService.saveNotes(notesDTO, user);
		attributes.addAttribute("success", "Notes saved Successfully");
		return "redirect:/notes";
	}
	
	
	@GetMapping("/edit-note/{id}")
	public String editNotes(@PathVariable Long id,RedirectAttributes attributes,Model model) {
		Optional<Department> notes =  notesRepository.findById(id);
		if(!notes.isPresent()) {
			attributes.addFlashAttribute("error","Notes not found");
			return "redirect:/notes";
		}
		DepartmentDTO notesDTO = new DepartmentDTO();
		notesDTO.setTitle(notes.get().getTitle());
		notesDTO.setDescription(notes.get().getDescription());
		model.addAttribute("note",notes.get());
		model.addAttribute("noteDTO",notesDTO);
		return "edit-notes";
	}
	
	@PostMapping("/edit-note/{id}")
	public String updateNotes(@Valid @ModelAttribute DepartmentDTO notesDTO, BindingResult result ,@PathVariable Long id,Model model, RedirectAttributes attributes) {
		if(result.hasErrors()) {
			Optional<Department> notes =  notesRepository.findById(id);
			model.addAttribute("note",notes.get());
			return "edit-notes";
		}
	Optional<Department> notes =  notesRepository.findById(id);
		if(!notes.isPresent()) {
			attributes.addAttribute("error","Notes not found");
			return "redirect:/notes";
		}
		notesService.updateNotes(notesDTO,id);
		attributes.addFlashAttribute("success","Notes updtaed successfully");
		return "redirect:/notes";
	}
	
	
	@GetMapping("/delete-note/{id}")
	public String deleteNote(@PathVariable Long id, RedirectAttributes attributes) {
	    Optional<Department> note = notesRepository.findById(id);
	    if (note.isPresent()) {
	        notesRepository.deleteById(id);
	        attributes.addFlashAttribute("success", "Note deleted successfully.");
	    } else {
	        attributes.addFlashAttribute("error", "Note not found.");
	    }
	    return "redirect:/notes";
	}
}
