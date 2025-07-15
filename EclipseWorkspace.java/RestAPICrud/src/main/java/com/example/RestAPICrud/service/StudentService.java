package com.example.RestAPICrud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.RestAPICrud.model.Student;
import com.example.RestAPICrud.repository.StudentRepository;

@Service
public class StudentService {

    private final StudentRepository studentRepo;

    public StudentService(StudentRepository studentRepo) {
        this.studentRepo = studentRepo;
    }

    public List<Student> getAll() {
        return studentRepo.findAll();
    }

    public Student getById(Long id) {
        return studentRepo.findById(id).orElseThrow(() -> new RuntimeException("Student not found"));
    }

    public Student save(Student student) {
        return studentRepo.save(student);
    }

    public Student update(Long id, Student updatedStudent) {
        Student student = getById(id);
        student.setName(updatedStudent.getName());
        student.setEmail(updatedStudent.getEmail());
        student.setCourse(updatedStudent.getCourse());
        return studentRepo.save(student);
    }

    public void delete(Long id) {
        studentRepo.deleteById(id);
    }
}
