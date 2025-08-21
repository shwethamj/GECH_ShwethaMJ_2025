package Array;

import java.util.Scanner;

// Find the second largest element in an array.
public class Second_Largest_num {

 public static void main(String[] args) {

	int[]arr1;
	Scanner sc = new Scanner(System.in);
	System.out.println("enter size of array :");
	int n = sc.nextInt();
	
	arr1 =new int[n];
	
	System.out.println("enter a elements of array");
	for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
		arr1[i] = sc.nextInt();
	}
	
	int min=arr1[0],max=arr1[0];
	for(int i=0;i<n;i++) {
		if(arr1[i]>max) {
			max = arr1[i];
		}
		if(arr1[i]<min) {
			min = arr1[i];
		}
	}
	
	int secmin = max,secmax=min;
	
	for(int i=0;i<n;i++) {
		if(arr1[i]>secmax && arr1[i]<max) {
			secmax = arr1[i];
		}
		if(arr1[i]<secmin && arr1[i]>min) {
			secmin = arr1[i];
		}
	}
	
	System.out.println("first min = "+min+ " and sec min is = "+secmin);
	System.out.println("first max = "+max+ " and sec max is = "+secmax);
}
}
