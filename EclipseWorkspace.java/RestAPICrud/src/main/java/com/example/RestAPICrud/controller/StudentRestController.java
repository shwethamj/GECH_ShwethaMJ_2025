package com.example.RestAPICrud.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.RestAPICrud.DTO.StudentDTO;
import com.example.RestAPICrud.model.Student;
import com.example.RestAPICrud.service.StudentService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/students")

public class StudentRestController {

    private final StudentService studentService;

    public StudentRestController(StudentService studentService) {
        this.studentService = studentService;
    }

  
    @GetMapping
    public List<Student> getAllStudents() {
        return studentService.getAll();
    }

    @GetMapping("/{id}")
    public Student getStudent(@PathVariable Long id) {
        return studentService.getById(id);
    }

    @PostMapping
    public Student createStudent(@Valid @RequestBody StudentDTO dto) {
        Student student = new Student(null, dto.getName(), dto.getEmail(), dto.getCourse());
        return studentService.save(student);
    }

    @PutMapping("/{id}")
    public Student updateStudent(@PathVariable Long id, @Valid @RequestBody StudentDTO dto) {
        Student updatedStudent = new Student(id, dto.getName(), dto.getEmail(), dto.getCourse());
        return studentService.update(id, updatedStudent);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.delete(id);
    }
}