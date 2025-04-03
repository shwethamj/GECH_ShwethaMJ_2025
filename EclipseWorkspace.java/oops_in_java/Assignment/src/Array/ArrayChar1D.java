package Array;

import java.util.Scanner;

public class ArrayChar1D {
	public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	System.out.println("enter the size of array");
	int size = sc.nextInt();
	char[] arr1= new char[size];
	
	  System.out.println("enter the values of array");
	  for(int i=0;i<size;i++) {
		  System.out.println("enter" +i+ "for array");
		  arr1[i]=sc.next().charAt(0);
	  }
	  System.out.println("Array elements are:");
	  for(char c :arr1) {
		  System.out.println(c);
	  }
	  sc.close();
	}
}
