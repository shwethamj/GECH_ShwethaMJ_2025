package Array;

import java.util.Scanner;

public class MissingNum_InArray {

	public static void main(String[] args) {

        // 1. Find missing number in array 1 to n
//        int[] arr1 = {1, 2, 4, 5, 6};
        

		int[]arr1;
		Scanner sc = new Scanner(System.in);
		System.out.println("enter size of array :");
		int n = sc.nextInt();
		
		arr1 =new int[n];
		
		
		System.out.println("enter a elements of array");
		for( int i=0;i<n;i++) {        // or for(int i=0 ;i<array.length;i++)
			arr1[i] = sc.nextInt();
		}
        System.out.println("enter total number of elemts that need in array");
		
        int n1 = sc.nextInt();
        int total = n1 * (n1 + 1) / 2;
        int sum = 0;
        for (int num : arr1) {
            sum += num;
        }
        System.out.println("Missing number: " + (total - sum));
//        System.out.println(10/4); // o/p==> 2
	}
}
