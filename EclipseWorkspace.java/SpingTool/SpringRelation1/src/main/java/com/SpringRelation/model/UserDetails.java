package com.SpringRelation.model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "userDetails")
public class UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String email;
	 private Date dob;
	 private int age;
	 
	 @OneToOne(mappedBy ="details")
	 private User user;

	 public int getId() {
		 return id;
	 }

	 public void setId(int id) {
		 this.id = id;
	 }

	 public String getEmail() {
		 return email;
	 }

	 public void setEmail(String email) {
		 this.email = email;
	 }

	 public Date getDob() {
		 return dob;
	 }

	 public void setDob(Date dob) {
		 this.dob = dob;
	 }

	 public int getAge() {
		 return age;
	 }

	 public void setAge(int age) {
		 this.age = age;
	 }

	 public User getUser() {
		 return user;
	 }

	 public void setUser(User user) {
		 this.user = user;
	 }
	 
	 
}
