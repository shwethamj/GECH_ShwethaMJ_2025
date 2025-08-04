package javaInterview;

//How to swap to variable without using third varibale ?
public class SwapVariable {

	public static void main(String[] args) {

		int a = 5;
		int b = 10;

		System.out.println("the value of A before swap : " + a);
		System.out.println("the value of B before swap : " + b);
		System.out.println("--------------------------------");
		a = a + b;
		b = a - b;
		a = a - b;

		System.out.println("the value of A after swap : " + a);
		System.out.println("the value of B after swap : " + b);

	}
}
