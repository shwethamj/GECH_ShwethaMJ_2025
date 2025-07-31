package arrayAssignment;

import java.util.Scanner;

public class RotatingArray {

	public static void main(String[] args) {
		
		 
		 System.out.println("Enter a size");
		 Scanner sc=new Scanner(System.in);
	       int n = sc.nextInt();
	       int[]array= new int[n];
	       
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
			
			System.out.println("enter key value by index");
	        int k = sc.nextInt();
	        
	        // Left Rotation
	        System.out.print("Left rotation by index "+k+" is" );
	        for (int i = k; i < n; i++) {
	            System.out.print(array[i] + " ");
	        }
	        for (int i = 0; i < k; i++) {
	            System.out.print(array[i] + " ");
	        }
	        System.out.println();

	        // Right Rotation
	        System.out.print("Right rotation by index : ");
	        for (int i = n - k; i < n; i++) {
	            System.out.print(array[i] + " ");
	        }
	        for (int i = 0; i < n - k; i++) {
	            System.out.print(array[i] + " ");
	        }
	}
}
