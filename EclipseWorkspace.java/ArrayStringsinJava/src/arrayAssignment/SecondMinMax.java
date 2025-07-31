package arrayAssignment;

import java.util.Scanner;

public class SecondMinMax {

		public static void main(String[] args) {
			
			Scanner sc = new Scanner(System.in);
			System.out.println("Enter the size of array");
			int n = sc.nextInt();
			int [] arr = new int[n];
			
			System.out.println("Enter the " +n +" elements");
			for(int i=0; i<n ; i++) {// to check the array size, we have an one variable is arr.length
				arr[i] = sc.nextInt();
					
			}
			
			System.out.println("The array elemnts are ");
			for(int i=0; i<=n-1 ; i++) {   // we can do this also i<=n-1 or i<n or i<=arr.length-1 or i<arr.length
				System.out.println(+arr[i]);
			}
			
			int max = arr[0] , min =arr[0];  //10 , 20 , 30 , 40
			for(int i=0 ;i<n;i++) {
				if(arr[i]<min) {
					min = arr[i];
				}
				 if(arr[i]>max) {
					max = arr[i];
				}
				
			}
			
			
			int secmin = Integer.MAX_VALUE;
			int secmax = Integer.MIN_VALUE;
			
			for(int i=0; i<n; i++) {
			if(arr[i]<secmin && arr[i]>min) {
				secmin =  arr[i];
			}
			if(arr[i]>secmax && arr[i]<max) {
				secmax = arr[i];
			}
		}
		
		System.out.println("The second min value " +secmin);
		System.out.println("The second max value " +secmax);
		
	
			
		}

	}