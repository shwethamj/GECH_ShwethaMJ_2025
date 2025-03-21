package ArrayInJava;

import java.util.Scanner;

public class ArrayInJava {
	
	/*
	 * Array in java: if we want to store a multiple value of the same datatype we use array
	  
	 
	 *How to  declare the array
	 *<datatype> [] array_name = new <datatype>[size];
	 *int[] array1= new int [4];
	 
	 * How to declare and initialize the array:
	 * int [] arr={1,2,3,4,5};
	 
	 *Types:
	 
	 *1.1D-> single row
	 *int[] array1= new int[4];
	 
	 *2. 2d -> in the form of table
	 *int[][] array1= new int[4][3];   --> 4*3 -->12
	 *
	 */
	public static void main(String[] args) {
		
	
	System.out.println("Array in java");
	int[] arr = new int[5];
	arr[0]=30;
	arr[1]=20;
	arr[2]=12;
	arr[3]=10;
	arr[4]=65;
	//arr[5] =50 => array index is out of bound exception
	
	for (int i=0;i<=4; i++) {
		arr[i]=10;
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
