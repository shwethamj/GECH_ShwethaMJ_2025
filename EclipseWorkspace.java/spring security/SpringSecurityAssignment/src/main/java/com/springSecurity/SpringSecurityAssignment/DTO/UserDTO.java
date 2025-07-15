package com.springSecurity.SpringSecurityAssignment.DTO;



import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class UserDTO {
	
	@NotBlank(message = "Name is required")
	private String name;
	
	@NotBlank(message = "email is required")
	@Email
	private String email;
	
	@NotBlank(message = "password is required")
	@Size(min=3,message="password need to have min 3 numbers")
	private String password;
	
	public UserDTO() {
		super();
	}
	
	public UserDTO(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}
	//getters and setters
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
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", email=" + email + ", password=" + password + "]";
	}
	
	
	
	

}
