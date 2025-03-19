package introduction_to_java.first_program;

import java.util.Scanner;

// scanner=used to take userinput\

public class UserInputValues {
	public static void main(String[]args) {
		int stdage=0;
		System.out.println("enetr a number");
		Scanner sc=new Scanner(System.in); 
		// this how scanner object is declare
		stdage=sc.nextInt();
		System.out.println("student age is:"+stdage);
		
		//byte =nextByte();
		//short=nextShow();
		//float=nextFloat();
		//double=nextDouble();
		//boolean=nextBoolean();
		
		sc.nextLine(); // buffering - if we not declare this here error will occer when enetr name execute so by this-- it read the next line		
		
		//char
		
		System.out.println("enetr a Gender");
		char gen=sc.nextLine().charAt(0);
		System.out.println("student Gender is:"+gen);
		
		
	}
	
}

