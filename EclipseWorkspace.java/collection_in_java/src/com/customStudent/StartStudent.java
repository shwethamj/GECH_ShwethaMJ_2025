package com.customStudent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class StartStudent {

	public static void main(String[] args) {
		
		Student1 std = new Student1("shwetha",43,20,"shwetha@gmail.com");
		System.out.println(std);
		
		Student1 std1 = new Student1("shwe",44,21,"shwe");
		Student1 std2 = new Student1("swethu",45,2,"shwethu");
		Student1 std3 = new Student1("shwet",42,98,"shwet");
		Student1 std4 = new Student1("sind",41,76,"sind");
		Student1 std5 = new Student1("radha",90,02,"radha");
		
		//passing the student1(class name) because i need to add a objects od student1 to list
		List<Student1> Students = new ArrayList<>();
		Students.add(std1);
		Students.add(std2);
		Students.add(std3);
		Students.add(std4);
		Students.add(std5);
		Students.add(new Student1("dillep",21,19,"dillep"));
		System.out.println(Students);
		
//		Students.remove(0);
//		System.out.println(Students);
		
		Collections.sort( Students,(s1,s2)->s2.getRollno()-s1.getRollno()); // higher to lower rollno
		// s1 - s2 means lower to higher 
		System.out.println("after sort");
		System.out.println(Students);
		
		Collections.sort(Students,(s1,s2)->s1.getAge()- s2.getAge()); // low to high
		System.out.println("for age:");
		System.out.println(Students);
		
		Collections.sort(Students,(s1,s2)->s1.getName().compareTo( s2.getName())); // low to high
		System.out.println("for Name:");
		System.out.println(Students);
		
		//Stream using
		List<Student1>  sorted = Students.stream().filter((marks)-> ( marks.getAge()>50)).collect(Collectors.toList());
		System.out.println("age greater than 50 : "+sorted);

	}

}
