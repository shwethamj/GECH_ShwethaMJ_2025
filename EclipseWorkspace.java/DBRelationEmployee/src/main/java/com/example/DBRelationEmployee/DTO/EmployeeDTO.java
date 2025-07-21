package com.example.DBRelationEmployee.DTO;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class EmployeeDTO {
	

	 private String name;
	    private String email;
	    private String password;
	    private String address;
	    private Set<Long> roles; // list of role IDs
	    private Long departmentId; // department ID
		public EmployeeDTO(String name, String email, String password, String address, Set<Long> roles,
				Long departmentId) {
			super();
			this.name = name;
			this.email = email;
			this.password = password;
			this.address = address;
			this.roles =  roles;
			this.departmentId = departmentId;
		}
		
		
		public EmployeeDTO() {
			   this.roles = new HashSet<>();
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
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public Set<Long> getRoles() {
			return roles;
		}
		public void setRoles(Set<Long> set) {
			this.roles = set;
		}
		public Long getDepartmentId() {
			return departmentId;
		}
		public void setDepartmentId(Long departmentId) {
			this.departmentId = departmentId;
		}
		@Override
		public String toString() {
			return "EmployeeDTO [name=" + name + ", email=" + email + ", password=" + password + ", address=" + address
					+ ", roles=" + roles + ", departmentId=" + departmentId + "]";
		}
	    
		

}
