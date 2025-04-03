package com.Studentform.StudentForm.dto;

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
	
	

}
