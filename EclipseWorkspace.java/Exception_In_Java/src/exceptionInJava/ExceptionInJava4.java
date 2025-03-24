package exceptionInJava;

public class ExceptionInJava4 {

	public static void main(String[] args) {
		/*
		 * finaly block
		 * ==> this will excecute even if exception occord or not
		 * ==>where we have to write the closing code like - db connection , file close
		 */

		/*
		 * //it execute finally (means print the syso of finally) and then shows the erorr  bcs here we dont used catch 
		try {
			System.out.println(10/0);
		}finally{
			System.out.println("this is finally block");
		}
		*/
		
		
		// it shows erorr first and display finally
		try {
			System.out.println(10/0);
		}catch(Exception e){
			System.out.println(e);
		}finally {
			System.out.println("this is finally block");
		}
	}

}
