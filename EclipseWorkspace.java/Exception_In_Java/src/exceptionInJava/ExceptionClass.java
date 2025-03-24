package exceptionInJava;

import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class ExceptionClass {
	
	/*
	 //stack overflow error
	public static void Display() {
		Display();
	}
	*/

	public static void main(String[] args) throws FileNotFoundException {
		
		//EXCEPTION IN JAVA:
		
		/*
		 * there is a unwanted or un expected  event occur in the program
		 * whenever there is exception the normal flow will stop
		 * exception -->parent of all exceptions
		 
		 * 2-Types:
		 * 1.checked Exception(compile time) ==>FileNotFoumdException(2 way)
		 * 2.unchecked exception(run time) ==>array IndexOutOfBoundException(2 way)
		 */
		
		
		/*
		 * ERROR:
		 * it is a problem where the programmer cannot handle it 
		 * ex: 
		 
		 *
		 */
		
		
		// ExceptionClass.Display(); // stack overflow error
		
		//checked error
		//1. try catch
		//2.throws
		
		
		
		//1.try-catch
		//PrintWriter  --> A class in java 
		PrintWriter printwriter;
		
		/*
		 * // file not found error will show when we write these 2 lines only and it suggest create the try catch (below one)
		 *  so we use try catch to handle that error 
		printwriter = new PrintWriter("abc.text"); // file not found error
		printwriter.println("hello world");
		*/
		
		try {
		printwriter = new PrintWriter("abc.text"); // it create a file abc.txt in the exception_in_java folder
		printwriter.println("hello world");
		System.out.println("hello world");
		printwriter.close();
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage()); 
			System.out.println(e);
		}
		
		
		//2.throws: it will create in main class line
		PrintWriter printwriter1 = new PrintWriter("throws.text"); // file not found error
		printwriter1.println("hello world");
		System.out.println("hello throws");
		printwriter1.close();
		
	}

}
