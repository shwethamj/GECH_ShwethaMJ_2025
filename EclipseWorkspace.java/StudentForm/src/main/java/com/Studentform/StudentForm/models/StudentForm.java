package com.Studentform.StudentForm.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "StudentForm")
public class StudentForm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name ="Std_id")
	private Long id;
	@Column(name="std_name")
	private String name;
	@Column(name ="std_age")
	private int age;
	@Column(name ="std_address")
	private String address;
	@Column(name="Std_email")
	private String email;
	
	//no args constructor
	public StudentForm() {
		super();
	}

	//constructor
	public StudentForm(Long id, String name, int age, String address, String email) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.address = address;
		this.email = email;
	}
// getters and setters

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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static void main(String[] args) {
		

	}

}
