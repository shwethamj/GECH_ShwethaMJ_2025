package Array;

import java.util.Scanner;

public class SecMin_SecMax_Array {

	public static void main(String[] args) {
		 
		        Scanner sc = new Scanner(System.in);
		        System.out.print("Enter size of array: ");
		        int n = sc.nextInt();
		        int[] arr = new int[n];
		        System.out.println("Enter elements:");
		        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();

		        int min = Integer.MAX_VALUE, secMin = Integer.MAX_VALUE; //Integer.MAX_VALUE is a constant in Java that represents the largest possible value an int can hold.
		        int max = Integer.MIN_VALUE, secMax = Integer.MIN_VALUE;

		        for (int x : arr) {
		            if (x < min) { 
		            	secMin = min; 
		            	min = x; 
		            	}
		            else if (x < secMin && x != min) 
		            	secMin = x;

		            if (x > max) { 
		            	secMax = max;
		            	max = x;
		            	}
		            else if (x > secMax && x != max) 
		            	secMax = x;
		        }

		        System.out.println("First min = " + min + ", Second min = " + secMin);
		        System.out.println("First max = " + max + ", Second max = " + secMax);	   

	}
}
