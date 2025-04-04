package com.simplespringboot.demo.models;

import jakarta.persistence.*;

/*
 * Java SE - standard edition - oracle
 * Java EE or j2ee = java enterprise edition -oracle
 * jakarta - once eclipse got it renamed as jakarta
 * */

@Entity
@Table(name = "students")
public class Student {

    @Id  // Primary key annotation 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "std_id")
    private long id; 

    @Column(name = "std_name")
    private String name;

    // Default constructor (needed for JPA)
    public Student() {
    }

    // Parameterized constructor
    public Student(String name) {
        this.name = name;  // No need to pass `id` since it's auto-generated
    }

    // Getters and Setters
    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
