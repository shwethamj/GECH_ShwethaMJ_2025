package exceptionInJava;

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
			
		}

}
