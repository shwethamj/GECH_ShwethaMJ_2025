package com.dental.DentalToolSupplySystem.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Users")

public class DentalTool {

	    @Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private long id;
		private String name;
		private String email;
		private String password;
		private String role;
		private String status;
		private String phoneNumber;

	    private String profileImage;

		public DentalTool() {
			super();
		}

		

		public DentalTool(long id, String name, String email, String password, String role, String status,
				String phoneNumber, String profileImage) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.password = password;
			this.role = role;
			this.status = status;
			this.phoneNumber = phoneNumber;
			this.profileImage = profileImage;
		}



		public String getPhoneNumber() {
			return phoneNumber;
		}



		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}



		public String getProfileImage() {
			return profileImage;
		}



		public void setProfileImage(String profileImage) {
			this.profileImage = profileImage;
		}



		public long getId() {
			return id;
		}
	
		public void setId(long id) {
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
	
		public String getRole() {
			return role;
		}
	
		public void setRole(String role) {
			this.role = role;
		}
		
	
		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}



		@Override
		public String toString() {
			return "DentalTool [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", role="
					+ role + ", status=" + status + ", phoneNumber=" + phoneNumber + ", profileImage=" + profileImage
					+ "]";
		}

		
	
}
