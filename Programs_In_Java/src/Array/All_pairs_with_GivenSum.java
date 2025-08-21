package Array;

import java.util.Scanner;

//Find all pairs in an array whose sum equals a given number.
public class All_pairs_with_GivenSum {

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
	
	
		System.out.println("enter a sum need to find in pair");
		int sum = sc.nextInt();
		boolean found =false;
		
		for(int i=0;i<n;i++) {
			for(int j=i+1;j<n;j++) {
			if(arr1[i] + arr1[j] == sum ) {
				
				System.out.println(sum+ " =  "+arr1[i]+" "+arr1[j]);
				found = true;
			}
			else {
				System.out.println("no pairs found ");
			}
		}
		}
	
	
		
		
	
	
	
	}
	
}
