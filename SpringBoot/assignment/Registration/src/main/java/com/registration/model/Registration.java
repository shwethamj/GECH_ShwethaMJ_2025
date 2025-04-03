package com.registration.model;

import java.util.List;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String email;
    private String phone;  // Changed from int to String
    private int age;
    private String dob;
    private String city;
    private String gender;
    
    @ElementCollection
    private List<String> skill;
    
    private String address;

    // Default constructor required by Hibernate
    public Registration() {}

    public Registration(long id, String name, String email, String phone, int age, String dob, String city, String gender, List<String> skill, String address) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.dob = dob;
        this.city = city;
        this.gender = gender;
        this.skill = skill;
        this.address = address;
    }

    // Getters and setters
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public List<String> getSkill() { return skill; }
    public void setSkill(List<String> skill) { this.skill = skill; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}
