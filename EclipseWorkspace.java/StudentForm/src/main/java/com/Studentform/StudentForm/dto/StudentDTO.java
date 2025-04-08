package com.Studentform.StudentForm.dto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

public class StudentDTO {
	@NotBlank(message = "student name is required")
	@NotEmpty
	private String name;
	
	@Min(10)
	private int age;
	
	@NotBlank(message = "student email is required")
	@Email
	private String email;
	
	@NotBlank(message = "student address is required")
	private String address;
	
	private MultipartFile image;
	
	private MultipartFile doc;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public MultipartFile getDoc() {
		return doc;
	}
	public void setDoc(MultipartFile doc) {
		this.doc = doc;
	}
	
	
	

}
