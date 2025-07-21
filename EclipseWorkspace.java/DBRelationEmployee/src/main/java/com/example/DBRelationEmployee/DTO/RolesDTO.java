package com.example.DBRelationEmployee.DTO;


import jakarta.validation.constraints.NotBlank;

public class RolesDTO {

	@NotBlank(message = "Role name is required.")
	private String rolename;

	public RolesDTO(@NotBlank(message = "Role name is required.") String rolename) {
		super();
		this.rolename = rolename;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	
	public RolesDTO() {
		super();
	}

	@Override
	public String toString() {
		return "RolesDTO [rolename=" + rolename + "]";
	}

	
}
