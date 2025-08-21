package exceptionInJava;

import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class ExceptionClass {
	
	/*
	 * camel_case contamination --> first letter need to capital --> FirstVar
	 * in python snake_case --> First_var		
	*/

	public static void main(String[] args) throws FileNotFoundException {
		/*
		EXCEPTION IN JAVA:
	    ====================
		 * Object(if we create any class that class extends Object class internaly) containes --> Throwable class\\
		 *https://docs.oracle.com/javase/8/docs/api/java/lang/Exception.html
		 
		 * there is a unwanted or un expected  event occur in the program
		 * ex: array size --> 3 --> 100,200,3000 --> if we give another one like for 4th one -->  array index out of bound
		 * whenever there is exception the normal flow will stop
		 
		 * exception -->parent of all exceptions
		 
		 * 2-Types:
		 * 1.checked Exception(compile time) ==>FileNotFoumdException(2 way)
		 		 we have  handle at compile time 
		 		 1. try catch
				 2.throws
		 * 2.unchecked exception(run time) ==>array IndexOutOfBoundException(1 way)
		 		 we have  handle at run time 
		
		  ERROR:
		  =======
		 * it is a problem where the programmer cannot handle it 
		 * ex: stackOverflow error
		
		 */
	
		
        //CHECKED EXCEPTION :
		
		/*
		 1.try-catch
		 =============
		 
		  PrintWriter printwriter; //PrintWriter  --> A class in java 
		  
		  printwriter = new PrintWriter("abc.text"); // file not found error
		  printwriter.println("hello world");
		
		 * file not found error will show when we write these 2 lines only and it suggest create the try catch (below one)
		   		so we use try catch to handle that error
		*/
		
		try {
		PrintWriter printwriter = new PrintWriter("abc.text"); // it create a file abc.txt in the exception_in_java folder
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
		PrintWriter printwriter1 = new PrintWriter("throws.text"); // file not found error //i
		printwriter1.println("hello world");
		System.out.println("hello throws");
		printwriter1.close();
		
		
		
	}
	
		
}
