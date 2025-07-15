package com.example.DBRelationEmployee.DTO;

import java.util.List;

import com.example.DBRelationEmployee.model.Employee;

import jakarta.persistence.CascadeType;
import jakarta.persistence.OneToMany;

public class DepartmentDTO {


	private String title;
	private String description;
	public DepartmentDTO(String title, String description) {
		super();
		this.title = title;
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "DepartmentDTO [title=" + title + ", description=" + description + "]";
	}
	public DepartmentDTO() {
		super();
	}
	
	
	
}
