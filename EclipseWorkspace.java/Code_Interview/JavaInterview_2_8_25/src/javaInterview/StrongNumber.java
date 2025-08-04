package javaInterview;

import java.util.Scanner;

//  Check Whether the given number is strong number or not ? 
public class StrongNumber {

	public static void main(String[] args) {
		
		System.out.println("enter a number");
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();
		
		int original =num;
		int digit ,fact,strongnum=0; 
		
		
		while(num >0) {
			digit = num %10;
			fact = 1;
			for(int i=1;i<=digit;i++) {
				fact *=i;
			}
			strongnum += fact;
			num /=10;
		}
		
		if(original == strongnum) {
			System.out.println("the number "+original + "is Strong Number");
		}
		else {
			System.out.println("the number "+original + " is not a Strong Number");
		}
		
		sc.close();
	}
}
