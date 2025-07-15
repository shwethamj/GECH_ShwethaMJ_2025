package com.example.DBRelationEmployee.model;

import java.util.List;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="roles")
public class Roles {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long id;
	private String rolename;
	
	@ManyToMany(mappedBy = "roles")
	private List<Employee> employee;
	
	
	public Roles() {
		super();
	}

	public Roles(Long id, String rolename, List<Employee> employee) {
		super();
		this.id = id;
		this.rolename = rolename;
		this.employee = employee;
	}

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public List<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "Roles [id=" + id + ", rolename=" + rolename + ", employee=" + employee + "]";
	}
	
	

}
