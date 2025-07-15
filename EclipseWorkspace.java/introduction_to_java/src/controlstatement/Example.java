package controlstatement;

import java.util.Scanner;

public class Example {
	
	public static void main(String[] args) {
		int num;
		System.out.println("enter the DAY");
		Scanner sc = new Scanner(System.in);
		num= sc.nextInt();
		
		switch(num) {
		case 1,2,3,4,5 -> System.out.println("Week days");
		case 6,7 -> System.out.println("Week End");
		default -> System.out.println("Invalid");
		}
		
		//or
		
		System.out.println("enter the DAY2");
		int day=sc.nextInt();
		
		String res = switch(day) {
		case 1,2,3,4,5-> "week Day"; 
		case 6,7 ->"Week End";
		default -> "Invalid";
		};
		System.out.println("the result is :"+res);
		
	}

}
