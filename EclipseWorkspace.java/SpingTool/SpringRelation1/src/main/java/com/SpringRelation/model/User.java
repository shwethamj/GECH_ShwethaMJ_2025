package com.SpringRelation.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="user")
public class User {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		private String name;
		
		@OneToMany(mappedBy = "user",cascade = CascadeType.ALL)
		private List<Address> address;
		
		@ManyToMany
		private List<Roles> roles;
		
		@OneToOne
		private UserDetails details;

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

		public List<Address> getAddress() {
			return address;
		}

		public void setAddress(List<Address> address) {
			this.address = address;
		}

		public List<Roles> getRoles() {
			return roles;
		}

		public void setRoles(List<Roles> roles) {
			this.roles = roles;
		}

		public UserDetails getDetails() {
			return details;
		}

		public void setDetails(UserDetails details) {
			this.details = details;
		}
		
		
}
