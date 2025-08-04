package javaInterview;

import java.util.Scanner;

// find a second max element in array ?
public class SecondMax_Array {

	public static void main(String[] args) {

		System.out.println("enter the size of array : ");
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();

		int[] array = new int[n];

		System.out.println("enter the elements :");
		for (int i = 0; i < n; i++) {
			array[i] = sc.nextInt();
		}

		// print
		System.out.println("the elemnts are : ");
		for (int i = 0; i < n; i++) {
			System.out.println(i + 1 + "element is : " + array[i]);
		}

		// max and min

		int max = array[0], min = array[0];

		for (int i = 0; i < n; i++) {
			if (array[i] > max) {
				max = array[i];
			}
			if (array[i] < min) {
				min = array[i];
			}
		}

		System.out.println("first min :" + min);
		System.out.println("first max :" + max);

		int secmax = min;
		for (int i = 0; i < n; i++) {
			if (array[i] > secmax && array[i] < max) {
				secmax = array[i];
			}
		}

		System.out.println("the second max number = " + secmax);

	}
}
