package ArrayInJava;

import java.util.Scanner;

public class ArrayInJava {
	
	/*
	 ARRAY
	 =====
	 * if we want to store a multiple value of the same data type we use array
	  	 
	 How to  declare the array
	 =========================
	 *<data type> [] arr_name;
	 *int [] arr;
	 		
	  How to  initialize the array:
	 ===========================
	 *<datatype> [] array_name = new <datatype>[size];
	 	example : int[] array1= new int [4];
	 
	 * int [] arr={1,2,3,4,5};
	 
	 Types:
	 ======
	 1.1D-> single row
	   	int[] array1= new int[4];
	 
	 2. 2d -> in the form of table
	 	int[][] array1= new int[4][3];   --> 4 row *3 col -->12 elements
	 
	 */
	public static void main(String[] args) {	
	
	System.out.println("Array in java");
	int[] arr = new int[5];
	
	//to reduce code we use for loop
	for (int i=0;i<=4; i++) {
		arr[i] = i+10; 
	}
	
	for(var i:arr) {
		System.out.println(i+"");
	}
	
	
	// write a program to take user input values and store inside the array and just print it
	Scanner sc = new Scanner(System.in);
	System.out.println("enter the size of array");
	int size = sc.nextInt();
	int[] arr1= new int[size];
	
	  System.out.println("enter the values of array");
	  for(int i=0;i<arr1.length;i++) {
		  System.out.println("enter" +i+ "for array");
		  arr1[i]=sc.nextInt();
	  }
	  System.out.println("Array elements are:");
	  for(int j=0; j<arr1.length; j++) {
		  System.out.println(arr1[j]+" ");
	  }
	  sc.close();
	}

}
