package com.SpringRelation.model;

import java.util.List;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="Projects")
public class Projects {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
		
	@ManyToMany(mappedBy = "projects") 
	private List<Employee> employee;
	
	/*it will create another tablewith default table name souce(parent)_child
	coloumn name --> employee_id and project_id
	
	if we want custom naem ==> 
		@JoinTable(name = "table_naem",
		joinColumns =  @JoinColumn(name ="column name"), //from parent name
		inverseJoinColumns = @JoinColumn(name ="column_name")) //from child
	 */

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

	public List<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}

	public Projects(int id, String name, List<Employee> employee) {
		super();
		this.id = id;
		this.name = name;
		this.employee = employee;
	}

	
													

}
