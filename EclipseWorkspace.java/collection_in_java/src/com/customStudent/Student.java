package com.customStudent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class Student1 implements Comparable<Student1>{	
	private String name;
	private int rollno;
	private int age ;
	private String email;

	public Student1(String name, int rollno, int age, String email) {
		super();
		this.name = name;
		this.rollno = rollno;
		this.age = age;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRollno() {
		return rollno;
	}

	public void setRollno(int rollno) {
		this.rollno = rollno;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Student1 [name=" + name + ", rollno=" + rollno + ", age=" + age + ", email=" + email + "]";
	}

	@Override
	public int compareTo(Student1 o) {
		// ascending order
		return this.rollno -o.rollno;
	}

}

//before java 8 features we used method comaparator 
class SortStudent implements Comparator<Student1>{
	@Override
	public int compare(Student1 o1, Student1 o2) {
		return o1.getRollno()-o2.getRollno();
	}
	
}

public class Student {
	public static void main(String[] args) {
		
		Student1 s1 = new Student1("shwetha",23,67,"shweetha@gmail.com");
		Student1 std1 = new Student1("shwe",44,21,"shwe");
		Student1 std2 = new Student1("swethu",45,2,"shwethu");
		Student1 std3 = new Student1("shwet",42,98,"shwet");
		Student1 std4 = new Student1("sind",41,76,"sind");
		Student1 std5 = new Student1("radha",90,02,"radha");
		
		System.out.println(s1);
		
		//storing objects in list
		List<Student1> Students = new ArrayList<>();
		Students.add(std1);
		Students.add(std2);
		Students.add(std3);
		Students.add(std4);
		Students.add(std5);
		Students.add(new Student1("dillep",21,19,"dillep"));
		
		System.out.println(Students);
		System.out.println("--------------------------------------------------------------------");
		
		//before implements the comparable interface to Student1
		//Collections.sort (list_name , (o1,o2) -> o2.get_name()-o1.get_name());  --> comparator
		Collections.sort( Students,(a1,a2)->a2.getRollno()-a1.getRollno()); // higher to lower roll num 
		System.out.println("after sort , rollno in descending order");
		System.out.println(Students);
		System.out.println("--------------------------------------------------------------------");

		
		//Comparator --> using comparator sorting by creating a separete class and implemnting a comparator interface
		System.out.println("using comparator sorting ");
		Collections.sort(Students, new SortStudent());
		System.out.println(Students);
		System.out.println("--------------------------------------------------------------------");

		
		//comparable need implements to studnet1 class  and overridethe method
		System.out.println("by implemting the comaprable to Student1 ");
		System.out.println(Students);
	}

}
