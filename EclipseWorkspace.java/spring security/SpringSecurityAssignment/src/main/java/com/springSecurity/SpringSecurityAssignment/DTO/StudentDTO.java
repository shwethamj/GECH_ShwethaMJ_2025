package com.springSecurity.SpringSecurityAssignment.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class StudentDTO {

	@NotBlank(message = "Name is required")
	private String name;
	
	@NotBlank(message = "email is required")
	@Email(message ="mising @")
	private String email;
	
	@NotBlank
	@Size(min = 3, message = "Password must be at least  characters long")
	private String password;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		password = password;
	}
	

}
