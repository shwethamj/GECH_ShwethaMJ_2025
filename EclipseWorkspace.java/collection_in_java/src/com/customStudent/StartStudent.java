package com.customStudent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class StartStudent {

	public static void main(String[] args) {
		
		Student std = new Student("shwetha",43,20);
		System.out.println(std);
		
		Student std1 = new Student("shwe",44,21);
		Student std2 = new Student("swethu",45,2);
		Student std3 = new Student("shwet",42,98);
		Student std4 = new Student("sind",41,76);
		Student std5 = new Student("radha",90,02);
		
		List<Student> Students = new ArrayList<>();
		Students.add(std1);
		Students.add(std2);
		Students.add(std3);
		Students.add(std4);
		Students.add(std5);
		Students.add(new Student("dillep",21,19));
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
		List<Student>  sorted = Students.stream().filter((marks)-> ( marks.getAge()>50)).collect(Collectors.toList());
		System.out.println("age greater than 50 : "+sorted);

	}

}
