package com.example.employeeform.employeevalidation.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "employees")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "emp_id")
	private int id;

	@Column(name = "emp_name", nullable = false)
	private String name;

	@Column(name = "employee_age")
	private int age;

	@Column(name = "employee_email", nullable = false, unique = true)
	private String email;

	@Column(name = "employee_password", nullable = false)
	private String password;
	
	private String imagePath;
	private String documentPath;

	

	public Employee() {
		super();
	}

	

	public Employee(int id, String name, int age, String email, String password, String imagePath,
			String documentPath) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.email = email;
		this.password = password;
		this.imagePath = imagePath;
		this.documentPath = documentPath;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	public String getDocumentPath() {
		return documentPath;
	}



	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}

	
}
