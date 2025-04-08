package com.Studentform.StudentForm.service;



import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Studentform.StudentForm.dto.StudentDTO;
import com.Studentform.StudentForm.models.StudentForm;
import com.Studentform.StudentForm.repository.StudentRepository;

@Service
public class StudentService {
	
	public StudentRepository studentRepository;
	
	
	//constructor injection
	public StudentService(StudentRepository studentRepository) {
		super();
		this.studentRepository = studentRepository;
	}
	
	public List<StudentForm> getAllStudents(){
		List<StudentForm> students = studentRepository.findAll();
		return students;
	}


	public void saveStudent(StudentDTO studentDTO) {
		MultipartFile image =studentDTO.getImage();
		Date createdata = new Date();
		String storeImageName =createdata.getTime()+"__"+ image.getOriginalFilename();
		System.out.println(storeImageName);
		
		// try and catch used to crete a folder for images to save and folder name is public/image
		// it will create folder within project 
		try {
			String uploadDir = "public/image/"; 
			// public/ is common and need to write it compulsory // or others cann be used but it need to name/name
			
			Path uploadPath = Paths.get(uploadDir);
			if(!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			
		try {
			InputStream inputStream = image.getInputStream();
			Files.copy(inputStream, Paths.get(uploadDir+storeImageName),StandardCopyOption.REPLACE_EXISTING);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	
		}catch(Exception e){
			System.out.println(e.getMessage());
			
		}
		
		//for doc add
		MultipartFile doc =studentDTO.getDoc();
		Date createdatas = new Date();
		String storeDocName =createdatas.getTime()+"__"+ doc.getOriginalFilename();
		System.out.println(storeDocName);
		
		try {
			String uploadDire = "public/docs/"; 
			// public/ is common and need to write it compulsory // or others cann be used but it need to name/name
			
			Path uploadPaths = Paths.get(uploadDire);
			if(!Files.exists(uploadPaths)) {
				Files.createDirectories(uploadPaths);
			}
			
		try {
			InputStream inputStreams = image.getInputStream();
			Files.copy(inputStreams, Paths.get(uploadDire+storeDocName),StandardCopyOption.REPLACE_EXISTING);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	
		}catch(Exception e){
			System.out.println(e.getMessage());
			
		}
		
		
		StudentForm student = new StudentForm();
		student.setName(studentDTO.getName());
		student.setAge(studentDTO.getAge());
		student.setEmail(studentDTO.getEmail());
		student.setAddress(studentDTO.getAddress());
		student.setImagePath(storeImageName);
		student.setDocPath(storeDocName);
		studentRepository.save(student);
	}

	
	public void deleteStudent(Long id) {
		StudentForm student = studentRepository.findById(id).get();
		String uploadDir = "public/image/";
		Path imagePath = Paths.get(uploadDir+student.getImagePath());
		try {
			Files.delete(imagePath);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		//for doc delete
		String uploadDire = "public/docs/";
		Path docPath = Paths.get(uploadDire+student.getDocPath());
		try {
			Files.delete(docPath);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		studentRepository.delete(student);	
	}
	
	
	

	public StudentDTO editStudent(Long id) {
		StudentForm student = studentRepository.findById(id).get();
		StudentDTO  studentDTO = new StudentDTO();
		studentDTO.setName(student.getName());
		studentDTO.setAge(student.getAge());
		studentDTO.setEmail(student.getEmail());
		studentDTO.setAddress(student.getAddress());
		return studentDTO;
		
	}


	public void updateStudent(StudentDTO studentDTO, Long id) {
		StudentForm student = studentRepository.findById(id).get();
		//to add / edit new image
		if(!studentDTO.getImage().isEmpty()) {
			Path oldImagePath = Paths.get("public/image/"+student.getImagePath());
			try {
				Files.delete(oldImagePath);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			MultipartFile image = studentDTO.getImage();
			Date createdAt = new Date();
			String storeImageName = createdAt.getTime()+"_"+image.getOriginalFilename();
			String uploadDir = "public/image/";
			try {
				InputStream inputStream = image.getInputStream();
				Files.copy(inputStream, Paths.get(uploadDir+storeImageName),StandardCopyOption.REPLACE_EXISTING);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			student.setImagePath(storeImageName);
			}
		
		//for docs
		if(!studentDTO.getDoc().isEmpty()) {
			Path oldDocPath = Paths.get("public/Docs/"+student.getDocPath());
			try {
				Files.delete(oldDocPath);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			MultipartFile doc = studentDTO.getDoc();
			Date created = new Date();
			String storeDocName = created.getTime()+"_"+doc.getOriginalFilename();
			String uploadDire = "public/docs/";
			try {
				InputStream inputStreams = doc.getInputStream();
				Files.copy(inputStreams, Paths.get(uploadDire+storeDocName),StandardCopyOption.REPLACE_EXISTING);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			student.setDocPath(storeDocName);
			}
		
		
		student.setName(studentDTO.getName());
		student.setEmail(studentDTO.getEmail());
		student.setAge(studentDTO.getAge());
		student.setAddress(studentDTO.getAddress());
		studentRepository.save(student);
	}
}
