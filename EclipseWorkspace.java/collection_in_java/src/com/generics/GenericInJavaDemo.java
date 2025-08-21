package com.generics;

//GENERIC CLASS:
class Student <T>{
	// int student_id; --> this for normal class
	T student_id; // T  can be declared while creating object
	T name;

		// public Student(int student_id) { --> for normal
		public Student(T student_id,T name) { // Constructor for  generic class
		super();
		this.student_id = student_id;
		this.name = name;
		}
	
		public  T returnValue() {
			return student_id;
			
		}
		public  T returnname() {
			return name;
			
		}

}

public class GenericInJavaDemo {

	public static void main(String[] args) {
		/* 
		 Generic class :
		 ==============
		 * for generic data type ==> T  can be declared while creating obj
		 * generic means parameterized types
		 * generic type is generic class or interface that is parameterized over types

		 * How to make our generic class like ArrayList<e> where we can chnage the object datatype 
		 * whenever  we want genric class --> using the <letter> like <T>  near the class_name

					Student std = new Student(12);
					int value = std.returnValue();
					System.out.println(value); 
	 	instead of above one we can use  below by making class into generic 
	 	
	 	* Student<Integer> std1 = new Student<Integer>(12);
		  before java 8 we use like this but in java 8 it is optional to use
		
		
		*/
		
		
		Student<Integer> std1 = new Student<>(12,34);
		Student<String> std2 = new Student<>("shwetha","sh");
		Student<Double> std3 = new Student<>(34.7,76.87);

		
		System.out.println("For int:"+std1.returnValue());
		System.out.println(" FOr String:"+std2.returnValue());
		System.out.println(" FOr String:"+std3.returnValue());

		
	}

}
