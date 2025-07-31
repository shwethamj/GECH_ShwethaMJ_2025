package ArrayInJava;

import java.util.Scanner;
//Max and min in array
public class Array3 {

	public static void main(String[] args) {
		
		int[]array;
		Scanner sc = new Scanner(System.in);
		System.out.println("enter size of array :");
		int n = sc.nextInt();
		
		array =new int[n];
		
		//input of array
		System.out.println("enter a elements of array");
		for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
			array[i] = sc.nextInt();
		}
		
		//maximum element in array and minimum
		int max =array[0] ,min=array[0];
		
		
		for(int i=0;i<n ;i++) {
			if(array[i]>max) {
				max= array[i];
			}
			if(array[i]<min) {
				min = array[i];
			}
		}
		System.out.println("Maximum element of array : "+max);
		System.out.println("Minimum element in array :"+min);
	}
}
