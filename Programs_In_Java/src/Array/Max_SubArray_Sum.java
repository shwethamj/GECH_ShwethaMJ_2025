package Array;

import java.util.Scanner;

public class Max_SubArray_Sum {

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
		
		System.out.println(" elements of array");
		for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
			System.out.println("i element is : "+arr1[i]);
		}
		
		int currentsum =arr1[0];
		int max =arr1[0];
		
		for(int i=1;i<n;i++) {
			currentsum = Math.max(currentsum, currentsum+arr1[i]); 
			max = Math.max(max, currentsum);
		}
		/*
		 *  arr1 = {1,2,3}  ==> subarrays == {1},{1,2},{1,2,3}
		 *  currentsum =max = arr1[0]= 1; -->{1}
		 *  
		 *  current sum = max(1, 1+2); = max(1,3) = 3 -->{1,2}
		 *  max =max(1,3)= 3
		 *  
		 *  current sum = max(3, 3+3); = max(1,6) = 6 -->{1,2,3}
		 *  
		 *  max =max(3,6)= 6
		 */
		
		System.out.println("the maximun sum of sub array of array is : "+max);
	}

}
