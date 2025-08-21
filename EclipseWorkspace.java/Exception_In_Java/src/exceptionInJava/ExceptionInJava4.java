package exceptionInJava;

public class ExceptionInJava4 {

	public static void main(String[] args) {
		/*
		 finally block :
		 =============
		  ==> this will execute even if exception occurred or not
		  ==> where we have to write the closing code like - db connection , file close
		  ==> what are the clean up resources(ex : db connection (while getting data from db the connection 
		      lost or exception occurred then finally will work,file close)
		      
		 Not work :
		 ==========
		  which scenario the finally not work 
			 1. when exception occur in finally block  
			 2. when system.exit(); used
			 
	     can we use multiple finnaly block in one try catch
	     ===============================================
	     	*No — in Java you cannot have multiple finally blocks for a single try.
	     	*The finally block is meant to be a single, guaranteed cleanup section for a given try statement, executed regardless of 
	     		whether an exception occurs.If Java allowed multiple finally blocks,
				 it would create ambiguity in the guaranteed execution order and would break the concept of one clean-up section.
			* If you want multiple clean-up steps . You just put them inside one finally block:
		 */

		//it execute finally (means print the syso of finally) and then shows the error  bcs here we don't used catch 
		try {
			System.out.println(10/0);
		}finally{
			System.out.println("this is finally block");
		}
		
		
		
		// it shows error first and display finally
		try {
			System.out.println(10/0);
		}catch(Exception e){
			System.out.println(e);
		}finally {
			System.out.println("this is finally block");
		}
	}

}
