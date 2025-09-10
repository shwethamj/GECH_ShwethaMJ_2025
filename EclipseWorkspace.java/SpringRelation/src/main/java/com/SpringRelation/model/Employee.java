package com.SpringRelation.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name ="employees")
public class Employee {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private String password;
	
	@OneToOne //below name
	private Address address;
	/*
	 * column adddress_id will create in employee table by default it take address(above given name)_id(name taken from address table)

		if want to customize the table name -->@JoinColumn(name="address1_id)
	
	 * one direction ==> employee has address and adress dont have employee and from employee we can access address adn by adreess we cannot accesss the employee
	 * bi-direction ==> both table has store extra  coloumn like address_id in employee and employee_id in address ==> its not prefered
	  --> by address can access employee and by employee can acess address
	  
	 * its not prefered we cannot have 2 columns like same --> use -->@onetoone(mappedBy = "child name" [in which i dont wnat coloumn] == address)write in child class only
		==> mappedBy ==> by this we can  access employee by address and address by employee , but not creating employee_id in address table
	*/
	
	@ManyToOne
	private Department department;
	
	@ManyToMany
	private List<Projects> projects;

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

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Projects> getProjects() {
		return projects;
	}

	public void setProjects(List<Projects> projects) {
		this.projects = projects;
	}

	public Employee(int id, String name, String email, String password, Address address, Department department,
			List<Projects> projects) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.department = department;
		this.projects = projects;
	}

	
	
}
