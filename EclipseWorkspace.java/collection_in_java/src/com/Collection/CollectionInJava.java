package com.Collection;

import java.util.Arrays;

class Student{
	String name;
	int age;
	
	public Student(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
}

public class CollectionInJava {

	public static void main(String[] args) {
		/*
		COLLECTION:
		===========
		 * why we need to use collection ?
		 * ==> to overcome the drawbacks of array we use collections
		  
		 Drawbacks of array:
		 =====================
		 * 1.Fixed size --> cannot change the size of array once declared
		 * 2. same data type elements cannot store multi data types
		 * 3.we cannot reduce the size of an array - cannot shrink or grow the array
		 
		 Advantages of array :
		 ====================
		 *1.Random access
		 *2. type safety --> the elements inside the array is based on one data type
		 *3.type casting --> to print elements in array -- no need to type casting
		 
		 *Also we can store more than one data type using array
		 *Object[] arr = new Object[5];
		 *
		 */
		
		int  [] arr = new int[2];
		arr[0] =12;
		arr[1] ='g'; //prints the ascii value of h -- which is integer
//		arr[1]=12.0; ==> Type mismatch: cannot convert from double to int

		
		int val= arr[0]; // no need of type casting like ==> int val = (int)arr[0];
		
		System.out.println("no need of typecasting in array");
		System.out.println((int)arr[1]); // no need of this in array we can use directly below one
		
		System.out.println(arr[1]);
		System.out.println("conveting to to string : " +Arrays.toString(arr)); //guaranty of declared datatype
		
		
		//using object 
		Object[] obj = new Object[4]; //no type safety
		obj[0] ="shwetha";
		obj[1] =12;
		obj[2] =12.3;
		
		Student std = new Student("shwetha",23);  //our object
		obj[3]=std; //can pass our own object to this array 
		
		String name = (String)obj[0]; //type casting needed
		Student stds = (Student) obj[3];	
		System.out.println("using object : "+Arrays.toString(obj));
			

	}

}
