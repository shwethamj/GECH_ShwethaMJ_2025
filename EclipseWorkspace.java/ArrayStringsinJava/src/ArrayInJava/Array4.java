package ArrayInJava;

import java.util.Scanner;

//reverse of array
public class Array4 {

	public static void main(String[] args) {
		
		int[]array;
		Scanner sc = new Scanner(System.in);
		System.out.println("enter size of array :");
		int n = sc.nextInt();
		
		array =new int[n];
		
		
		System.out.println("enter a elements of array");
		for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
			array[i] = sc.nextInt();
		}
		
		//print of array
		System.out.println("the array elements are :");
		for(int i=0;i<n;i++) {
			System.out.println(i+1 + " element is : "+array[i]);
		}
		
		int temp;
		//print of array in reverse order
		System.out.println("the  Reverse array elements are :");
		for(int i=0 ,j=n-1;i<j; i++,j--) {
			 temp =array[i];
			 array[i]=array[j];
			 array[j]=temp;
			 
			
		}
		
		for(int k=0;k<n;k++) {
			System.out.println((k+1)+ "element is : "+array[k]);
		}
	}
}
