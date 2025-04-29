package com.example.employeeform.employeevalidation.service;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.employeeform.employeevalidation.dto.*;
import com.example.employeeform.employeevalidation.model.*;
import com.example.employeeform.employeevalidation.repository.*;

@Service
public class EmployeeService {
	private final EmployeeRepository employeeRepository;

	// Constructor injection
	public EmployeeService(EmployeeRepository employeeRepository) {
		this.employeeRepository = employeeRepository;
	}

	// Fetch all employees
	public List<Employee> getAllEmployees() {
		return employeeRepository.findAll();
	}

	// Save a new employee
	public void saveEmployee(EmployeeDTO employeeDTO) {
		MultipartFile image= employeeDTO.getImage();
		Date createdAt=new Date();
		String storeImageName=createdAt.getTime()+"_"+image.getOriginalFilename();
		System.out.println(storeImageName);
		try {
			String uploadDir="public/employeeimages/";
			Path uploadPath=Paths.get(uploadDir);
			if(!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			try {
				InputStream inputstream=image.getInputStream();
				Files.copy(inputstream, Paths.get(uploadDir+storeImageName),StandardCopyOption.REPLACE_EXISTING );
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		MultipartFile document= employeeDTO.getDocument();
		Date createdAt1=new Date();
		String storeDocumentName=createdAt1.getTime()+"_"+document.getOriginalFilename();
		System.out.println(storeDocumentName);
		try {
			String uploadDir1="public/employeedocument/";
			Path uploadPath1=Paths.get(uploadDir1);
			if(!Files.exists(uploadPath1)) {
				Files.createDirectories(uploadPath1);
			}
			try {
				InputStream inputstream=document.getInputStream();
				Files.copy(inputstream, Paths.get(uploadDir1+storeDocumentName),StandardCopyOption.REPLACE_EXISTING );
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		Employee employee = new Employee();
		employee.setName(employeeDTO.getName());
		employee.setAge(employeeDTO.getAge());
		employee.setEmail(employeeDTO.getEmail());
		employee.setPassword(employeeDTO.getPassword());
		employee.setImagePath(storeImageName);
		employee.setDocumentPath(storeDocumentName);
		
		employeeRepository.save(employee);
	}

	// Delete an employee by ID
	public void deleteEmployee(int id) {
		Employee employee = employeeRepository.findById(id).get();
		String uploadDir="public/employeeimages/";
		Path imagePath=Paths.get(uploadDir+employee.getImagePath());
		try {
			Files.delete(imagePath);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String uploadDir1="public/employeedocuments/";
		Path documentPath=Paths.get(uploadDir1+employee.getDocumentPath());
		try {
			Files.delete(documentPath);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
				
		employeeRepository.delete(employee);
	}

	// Get an employee for editing
	public EmployeeDTO getEmployeeById(int id) {
		Employee employee = employeeRepository.findById(id).get();
				
		EmployeeDTO employeeDTO = new EmployeeDTO();
		employeeDTO.setName(employee.getName());
		employeeDTO.setAge(employee.getAge());
		employeeDTO.setEmail(employee.getEmail());
		employeeDTO.setPassword(employee.getPassword());
		return employeeDTO;
	}

	// Update an employee
	public void updateEmployee(EmployeeDTO employeeDTO, int id) {
		Employee employee = employeeRepository.findById(id).get();
		if(!employeeDTO.getImage().isEmpty()) {
			Path oldImagePath = Paths.get("public/employeeimages/"+employee.getImagePath());
			try {
				Files.delete(oldImagePath);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			MultipartFile image = employeeDTO.getImage();
			Date createdAt = new Date();
			String storeImageName = createdAt.getTime()+"_"+image.getOriginalFilename();
			String uploadDir = "public/employeeimages/";
			try {
				InputStream inputStream = image.getInputStream();
				Files.copy(inputStream, Paths.get(uploadDir+storeImageName),StandardCopyOption.REPLACE_EXISTING);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			employee.setImagePath(storeImageName);
			}
		
		if(!employeeDTO.getDocument().isEmpty()) {
			Path oldDocumentPath = Paths.get("public/employeedocuments/"+employee.getDocumentPath());
			try {
				Files.delete(oldDocumentPath);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			MultipartFile document = employeeDTO.getDocument();
			Date createdAt = new Date();
			String storeDocumentName = createdAt.getTime()+"_"+document.getOriginalFilename();
			String uploadDir1 = "public/employeedocuments/";
			try {
				InputStream inputStream = document.getInputStream();
				Files.copy(inputStream, Paths.get(uploadDir1+storeDocumentName),StandardCopyOption.REPLACE_EXISTING);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			employee.setDocumentPath(storeDocumentName);
			}		
		employee.setName(employeeDTO.getName());
		employee.setAge(employeeDTO.getAge());
		employee.setEmail(employeeDTO.getEmail());
		employee.setPassword(employeeDTO.getPassword());
		
		employeeRepository.save(employee);
	}

	
}
