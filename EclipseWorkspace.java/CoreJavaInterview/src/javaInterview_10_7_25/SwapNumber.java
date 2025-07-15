package javaInterview_10_7_25;

public class SwapNumber {

	public static void main(String[] args) {
		int a=10;
		int b=20;
		
		System.out.println("before: "+a);
		System.out.println("before: "+b);
		
		a=a+b;
		b=a-b;
		a=a-b;
		
		System.out.println("after"+a);
		System.out.println("after"+b);
	}
}
