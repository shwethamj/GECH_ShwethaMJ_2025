package com.Collection;

public class CollectionInJava {

	public static void main(String[] args) {
		// COLLECTION:
		
		/*
		 * why we need to use collection ?
		 * ==> to overcome the drawbacks of array we use collections
		  
		 * Drawbacks of array:
		 * 1.Fixed size --> cannot change the size of array once declared
		 * 2. same datatype elements cannot store multi datatypes
		 * 3.we cannot reduce the size of an array - cannot shrink the array
		 
		 *Advantages of array
		 *1.Rnadom acceess
		 *2. type safety --> the elemnts inside the array is based on one datatype
		 *3.type casting --> to print elements in array -no need to type casting
		 *
		 */
		int  [] arr = new int[2];
		arr[0] =12;
		arr[1] ='g'; //prints the ascii value of h -- which is integer
		System.out.println("no need of typecasting in array");
		System.out.println((int)arr[1]); // no need of this in array we can use directly below one
		System.out.println(arr[1]);
		

	}

}
