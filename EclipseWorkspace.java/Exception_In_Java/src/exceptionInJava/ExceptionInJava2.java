package exceptionInJava;

import java.util.Scanner;

public class ExceptionInJava2 {

	public static void main(String[] args) {
		//UNCHECKED EXCEPTION
		
		int a =12;
		int b=0;
		try {
			// if a/b = 12/0 ==>12 cannot be divided by 0 this called as==>ArithmeticException
		System.out.println("the result is:"+(a/b));

	    }
		catch(ArithmeticException e){
			System.out.println(a);
			System.out.println(b);
			System.out.println(e.getMessage()); // only gives in the describe(text) exception
			e.printStackTrace(); // another method using e to display error 
		}

//2. example :
		Scanner sc = new Scanner(System.in);
		System.out.println("enter first number");
		int d = sc.nextInt();
		System.out.println("enter first number");
		int e = sc.nextInt();
		
		//int res = a/b;  // 10/0 -->ArithmeticException
		
	try {
		int res = d/e;
		System.out.println("the result is : "+res);
	} catch (ArithmeticException e2) {
		System.out.println(e2.getMessage()); // only gives in the describe(text) exception ==> / by zero		
		e2.printStackTrace(); 
		System.out.println(e2); //  java.lang.ArithmeticException: / by zero
	}
		
		String name = null;
		name.concat("hello"); // nullpointerException
}

}
