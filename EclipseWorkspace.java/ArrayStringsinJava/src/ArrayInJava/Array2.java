package ArrayInJava;

import java.util.Scanner;

//Sum of Array
public class Array2 {

	public static void main(String[] args) {
		
		int[]array;
		Scanner sc = new Scanner(System.in);
		System.out.println("enter size of array :");
		int n = sc.nextInt();
		
		array =new int[n];
		
		//input of array
		System.out.println("enter a elements of array");
		for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
			array[i] = sc.nextInt();
		}
		
		//print of array
		System.out.println("the array elements are :");
		for(int i=0;i<n;i++) {
			System.out.println(i+1 + " element is : "+array[i]);
		}
		
		//sum of array
		int sum=0;
		System.out.println("Sum of Array is :");
		for(int i=0;i<n;i++) {
			 sum += array[i]; 
		}
		
		System.out.println("sum = "+sum);
		sc.close();
	
	}
}
