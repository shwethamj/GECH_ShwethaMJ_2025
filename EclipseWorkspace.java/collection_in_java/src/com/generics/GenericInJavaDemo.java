package com.generics;

// generic means parameterized types
// generic type is generic class or interface that is parameterized over types

class Student <T>{
	// int student_id; this for normal class
	T student_id; // for generic datatype == T  can be declared while craeting obj

	// public Student(int student_id) {  ==> it was for normal
		public Student(T student_id) { // for make generic class
		super();
		this.student_id = student_id;
	}
	
	public  T returnValue() {
		return student_id;
	}

}
public class GenericInJavaDemo {

	public static void main(String[] args) {
		// How to make our generic class like ArrayList<e> where we can chnage the object datatype 
		 // whenever and where ver  we want using the <letter> like <T>  near the class_name

//		Student std = new Student(12);
//		int value = std.returnValue();
//		System.out.println(value); 
	// instead of above one we can use  below by making class into generic 
		
		
		//Student<Integer> std1 = new Student<Integer>(12);
		//before java 8 we use like this but in java 8 it is optional to use
		
		Student<Integer> std1 = new Student<>(12);
		Student<String> std2 = new Student<>("shwetha");
		System.out.println("For int:"+std1.returnValue());
		System.out.println(" FOr String:"+std2.returnValue());
		
	}

}
