package com.Stream;


// Assignment

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class Student1{
	private String name;
	private int roll;
	private double marks;
	
	//getters setters for access marks in filter (s.getmarks())
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoll() {
		return roll;
	}
	public void setRoll(int roll) {
		this.roll = roll;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	
	// constructor to input the student data 
	public Student1(String name, int roll, double marks) {
		super();
		this.name = name;
		this.roll = roll;
		this.marks = marks;
	}
	
	// toString for directly print the object
	@Override
	public String toString() {
		return "Student1 [name=" + name + ", roll=" + roll + ", marks=" + marks + "]";
	}
		
}


public class StudentDetails {

	public static void main(String[] args) {
		
		Student1 std1 = new Student1("shwe",44,70);
		Student1 std2 = new Student1("swethu",45,45);
		Student1 std3 = new Student1("shwet",42,98);
		Student1 std4 = new Student1("sind",41,76);
		Student1 std5 = new Student1("radha",90,02);
		
		List<Student1> Students = new ArrayList<>();
		Students.add(std1);
		Students.add(std2);
		Students.add(std3);
		Students.add(std4);
		Students.add(std5);
		
		System.out.println(Students);
		
		Stream<Student1> stream = Students.stream();
		List<Student1> numbers = stream.filter((s) ->s.getMarks()>60).collect(Collectors.toList());
		System.out.println("above 60 marks: "+numbers);
		
		
		


	}

}
