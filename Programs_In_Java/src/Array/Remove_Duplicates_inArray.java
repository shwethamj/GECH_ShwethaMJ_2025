package Array;

import java.util.LinkedHashSet;
import java.util.Scanner;
import java.util.Set;

//Remove duplicates from a sorted array.
public class Remove_Duplicates_inArray {

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
		for( int i=0;i<n;i++) {        
			System.out.println("i element is : "+arr1[i]);
		}
		
		//using set for unsorted array
//		Set<Integer> set = new LinkedHashSet<Integer>(); //linkedhashmap removes the duplicates and preserve order
//		for(int num :arr1) {
//			set.add(num); //adding elemnts to set which arr presnet in array
//		}
//		
//		System.out.println("the elements after removing duplicates :"+set);
		
		
		//for sorted array
		int j=0;
		for(int i=0;i<n-1;i++) {
			if(arr1[i] != arr1[i+1]) {
				arr1[j++]= arr1[i];
			}
		}
		arr1[j++]= arr1[n-1]; // the j will increament upto n-2 so for last element we insert here
	
		System.out.println("after removing duplicates");
		for( int i=0;i<j;i++) {        
			System.out.println(arr1[i]);
		}
		
	}
}
