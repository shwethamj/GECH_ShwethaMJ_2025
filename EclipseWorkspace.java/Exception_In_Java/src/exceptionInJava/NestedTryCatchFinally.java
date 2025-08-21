package exceptionInJava;

public class NestedTryCatchFinally {
	
	/*
	 * If outer try has no exception before the inner try, execution reaches the inner try normally(checks inner try if excpetion goto inner catch.
	 * If outer try does have an exception before inner try, control jumps directly to outer catch, skipping the inner try and catch.
	 
	 *If the outer (parent) try has an exception before it even reaches the inner try,
		then the inner try will never run.
	 */

	public static void main(String[] args) {
		
		try { // Outer try block
		    int[] numbers = {1, 2, 3};
		    
		    try { // Inner try block
		        System.out.println(numbers[5]); // Potential ArrayIndexOutOfBoundsException in inner try catch so they will run
		    } catch (ArrayIndexOutOfBoundsException e) {
		        System.out.println("Inner catch: Array index out of bounds.");
		    }
		    
		    int result1 = 10 / 0; // Potential ArithmeticException in parent try so goes to catch and executes
		    
		} catch (ArithmeticException e) {
		    System.out.println("Outer catch: Cannot divide by zero.");
		}
		System.out.println("------------------------------------------------------------");
		
		/*
		  In this example, an ArrayIndexOutOfBoundsException is caught by the inner catch block,
		  while an ArithmeticException is caught by the outer catch block. 
		 */
	
		
		
	
	// 2. Example :
        try {
            // Initializing array
            int a[] = { 1, 2, 3, 4, 5 };

            // Trying to print element at index 5
            //here the parent has exception so it skips the inner try catch and goes to parent catch
            System.out.println(a[5]); 

            // Inner try block (try-block2)
            try {
                // Performing division by zero
                int x = a[2] / 0; // This will throw ArithmeticException
            } catch (ArithmeticException e2) {
                System.out.println("Division by zero is not possible");
            }
        } catch (ArrayIndexOutOfBoundsException e1) {
            System.out.println("ArrayIndexOutOfBoundsException");
            System.out.println("Element at such index does not exist");
        }
		System.out.println("----------------------------------------------------------------------");
  
            
	}
}
