package com.SpringBootDataJPA.model;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/*entity class
 ==============
 	jpa --> jakarta persistence api
 
	 * every entity class need to  be pojo class
	 * pojo --> plain old java object -->need to containes fields, getter setter ,constructor,tostring
 
 	@entity ---> used to understand heibernant to create a table
	@table --> to give custom name for table
	@Column(name="std_name") --> to give custom name for column otherwise --> field name will default take as column name
 	@ID --> to declare as primary key
 	@GeneratedValue --> to  do autoIncrement
 */

@Entity //default name for table is Student(class_name)
@Table(name = "student_detail") 
public class Student {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="std_id")
	private int id;
	
	private String name;
	private String email;
	private int age;
	private String stdName; // its camel case --> so java takes it as std_name as table name
	
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	
	
	public Student() {
		super();
	}
	
	public Student( String name, String email, int age, String stdName) {
		super();
		this.name = name;
		this.email = email;
		this.age = age;
		this.stdName = stdName;
	}
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", Email=" + email + ", age=" + age + ", stdName=" + stdName
				+ "]";
	}
	
	

}
