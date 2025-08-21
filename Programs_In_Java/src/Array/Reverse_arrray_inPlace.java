package Array;

import java.util.Scanner;

// Reverse an array in-place without using extra space.
public class Reverse_arrray_inPlace {

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
		
		int temp;
		System.out.println("the reverse order of array");
		for(int i=0,j =n-1; i<j;i++,j--) {
			temp = arr1[i];
			arr1[i]=arr1[j];
			arr1[j]=temp;
		}
		
		
		System.out.println(" elements of array");
		for( int k=0;k<n;k++) {        // or for(int i=0 ;i<array.length;i++)
			System.out.println("i element is : "+arr1[k]);
		}
	}
}
