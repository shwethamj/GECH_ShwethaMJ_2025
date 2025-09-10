package com.dependency_injection;

//constructor injection

public class Student {
	public String s_name;
	private Subject subject;
	
	public Student(String s_name, Subject subject) { //constructor injection
		super();
		this.s_name = s_name;
		this.subject = subject;
	}

	public static void main(String[] args) {
		
		Subject sub = new Subject("maths"); //passing value for subject constructor(subject name)
		
		Student student = new Student("shwetha",sub);//constructor injection 
		
		System.out.println(student.subject); //hashcode //address
		System.out.println(sub.name);//maths
		System.out.println(student.subject.name);//maths
		System.out.println(student.s_name );
	}

}
