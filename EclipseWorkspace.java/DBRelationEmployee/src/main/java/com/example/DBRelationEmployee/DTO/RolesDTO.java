package com.example.DBRelationEmployee.DTO;

import java.util.List;

import com.example.DBRelationEmployee.model.Employee;

import jakarta.persistence.ManyToMany;

public class RolesDTO {

	private long id;
	private String rolename;
	
	

	public RolesDTO() {
		super();
	}

	public long getId() {
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

	

	public RolesDTO(long id, String rolename) {
		super();
		this.id = id;
		this.rolename = rolename;
		
	}

	@Override
	public String toString() {
		return "RolesDTO [id=" + id + ", rolename=" + rolename +  "]";
	}
	
	
}
