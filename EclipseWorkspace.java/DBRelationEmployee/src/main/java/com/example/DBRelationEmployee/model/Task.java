package com.example.DBRelationEmployee.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name ="Tasks")
public class Task {


	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String title;

	    private LocalDate deadline;

	    private String status; // e.g., "Pending", "Completed"

	    @ManyToOne
	    @JoinColumn(name = "employee_id")
	    private Employee employee;

		public Task(Long id, String title, LocalDate deadline, String status, Employee employee) {
			super();
			this.id = id;
			this.title = title;
			this.deadline = deadline;
			this.status = status;
			this.employee = employee;
		}

		public Task() {
			super();
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

		public Employee getEmployee() {
			return employee;
		}

		public void setEmployee(Employee employee) {
			this.employee = employee;
		}

		@Override
		public String toString() {
			return "Task [id=" + id + ", title=" + title + ",  deadline=" + deadline
					+ ", status=" + status + "]";
	    
		
		
	}

}
