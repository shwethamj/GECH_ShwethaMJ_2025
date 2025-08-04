package arrayAssignment;

import java.util.Scanner;

 // factorial of number using recursion
public class Factorial_Recursion {
	static int factorial(int n) {
		if(n==0 || n==1) {
			return 1;
		}
		else {
			return n * factorial(n-1);
		}
	}
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("enter number :");
		int n = sc.nextInt();
		
		int fact = factorial(n);
		System.out.println("the factorial of "+n+ " is "+fact);
		
		sc.close();
	}
}
