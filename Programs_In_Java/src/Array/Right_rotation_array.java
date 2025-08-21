package Array;

import java.util.Scanner;

//Rotate an array by k positions (both left and right rotation).
public class Right_rotation_array {

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
		
		System.out.println("enter a index need to be rotated:");
		int k =sc.nextInt();
		
		for(int i=k;i<n;i++) {
			System.out.print("elements : " + arr1[i]);
		}
		for(int i=0;i<k;i++) {
			System.out.print(  arr1[i]);
		}
	}
}
