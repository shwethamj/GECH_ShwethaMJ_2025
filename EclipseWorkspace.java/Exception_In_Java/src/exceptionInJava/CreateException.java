package exceptionInJava;

//Creating our own exception

class InvalidationException extends Exception{
	public InvalidationException(String message) {
		super(message);
	}
	
}
public class CreateException {

	//Creating our own exception -- by extending exception class

	public static void validateAge(int age) throws InvalidationException {
		if(age<18) {
			throw new InvalidationException("Invalid age");
		}
		else {
			System.out.println("your age is:"+age);
		}
	}
	
	public static void main(String[] args) {
		
		try {
			validateAge(10);
		} catch (InvalidationException e) {
			System.out.println(e.getMessage());
		}
		
	}
}
