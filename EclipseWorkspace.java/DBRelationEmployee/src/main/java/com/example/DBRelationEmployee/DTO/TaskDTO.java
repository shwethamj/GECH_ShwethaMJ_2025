package com.example.DBRelationEmployee.DTO;

import java.time.LocalDate;

import com.example.DBRelationEmployee.model.Employee;

import lombok.Data;

@Data
public class TaskDTO {

    private Long id;
    private String title;
    private LocalDate deadline;
    private String status;
    private Long employeeId;
    private Employee employee;
    
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public LocalDate getDeadline() {
		return deadline;
	}
	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "TaskDTO [id=" + id + ", title=" + title + ", deadline=" + deadline + ", status=" + status
				+ ", employeeId=" + employeeId + ", employee=" + employee + "]";
	}
	
	
    
}

