package javaInterview;

import java.util.Scanner;

// How to reverse a number ?
public class ReverseNumber {

	public static void main(String[] args) {

		System.out.println("enter a number : ");
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();

		int remainder, reversed = 0;
		while (num > 0) {
			remainder = num % 10;
			reversed = reversed * 10 + remainder;
			num /= 10;
		}
		System.out.println("the reverse of number = " + reversed);

	}
}
