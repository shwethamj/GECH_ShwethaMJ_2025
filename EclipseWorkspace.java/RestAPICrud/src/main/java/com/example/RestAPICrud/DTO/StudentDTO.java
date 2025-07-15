package com.example.RestAPICrud.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentDTO {

    @NotBlank(message = "Name cannot be blank")
    private String name;

    @NotBlank(message = "Email cannot be blank")
    @Email(message = "Invalid email format")
    private String email;

    @NotBlank(message = "Course cannot be blank")
    private String course;

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

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public StudentDTO(@NotBlank(message = "Name cannot be blank") String name,
			@NotBlank(message = "Email cannot be blank") @Email(message = "Invalid email format") String email,
			@NotBlank(message = "Course cannot be blank") String course) {
		super();
		this.name = name;
		this.email = email;
		this.course = course;
	}
    
    
}
