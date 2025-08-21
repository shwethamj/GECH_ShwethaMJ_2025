package Loops;

import java.util.Scanner;

public class ArmStrong_Num {
	
	public static void main(String[] args) {	
	
	        Scanner sc = new Scanner(System.in);
	        System.out.print("Enter a number: ");
	        int n = sc.nextInt();

	        int original = n;
	        int sum = 0;
	        int digits = String.valueOf(n).length(); //converting digit to string and counting length

	        while (n != 0) {
	            int digit = n % 10;
	            sum += Math.pow(digit,digits );
	            n /= 10;
	           
	        }
	        System.out.println(sum);

	        if (sum == original) {
	            System.out.println("Armstrong Number");
	        } else {
	            System.out.println("Not Armstrong Number");
	        }
		
	}
}
