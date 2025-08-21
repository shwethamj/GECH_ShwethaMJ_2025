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
		 
		
		/*
		 THROW:
		 ======
			 
			 * throws --> used to handle the checked exception
			 * throw --> explicitly throw an new exception /user defined(custom) exception 
			
			 *  ==> it is used to throw the exception
			 *  built in exception class ==> ArithmeticException,nullpointerexception , 
	   */

		try {
			validation(20);
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			System.out.println("program executed");
		}
	}

}
