package javaInterview_10_7_25;

import java.util.Scanner;

public class SumofNatural {

	public static void main(String[] args) {
		
		int num,val=0;
		Scanner sc = new Scanner(System.in);
		System.out.println("enter a num : ");
		num = sc.nextInt();
		
		for(int i=1;i<=num;i++) {
//			val = i+val;
			val +=i;
			
		}
		
		System.out.println("the sum of n natural number: "+val);

		
	}
}
