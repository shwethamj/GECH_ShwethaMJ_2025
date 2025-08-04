package javaInterview;

import java.util.Scanner;

// How to calculate factorial using recursion ?
public class Factorial {

	public static void main(String[] args) {
		
		int fact=1,n;
		
		System.out.println("enter a number");
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		
		for(int i=1;i<=n;i++) {
			fact *= i;
		}
		System.out.println("factorial of " +n+ " is = "+fact);
		
	}
}
