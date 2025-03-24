package exceptionInJava;

public class ExceptionInJava5 {

	public static void validation(int age) {
		if(age<18) {
			throw new ArithmeticException("Invalid age");
		}
		else {
			System.out.println("your age is:"+age);
		}
	}
	public static void main(String[] args) {
		 
		// THROW:
		/*
		 *  ==> it is used to throw the exception
		 */

		try {
			validation(20);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
