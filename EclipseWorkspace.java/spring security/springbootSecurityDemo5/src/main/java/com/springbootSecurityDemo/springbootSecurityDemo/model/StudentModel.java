package com.springbootSecurityDemo.springbootSecurityDemo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
//import lombok.Data;
//import lombok.AllArgsConstructor;
//import lombok.RequiredArgsConstructor;

@Entity
@Table(name="Students")

// this three used to cretae a getter setter(data) , constructor(AllArgsConstructor),noargs constructor(RequiredArgsConstructor) by default without mannnualy creating it
// to reduce code it will use
//@Data
//@AllArgsConstructor
//@RequiredArgsConstructor
public class StudentModel {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String email;
	private String password;
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
		return "StudentModel [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", role="
				+ role + "]";
	}
	
	
	
	
}
