package exceptionInJava;

public class ExceptionInJava3 {

	public static void main(String[] args) {
		
		// try with multiple catches:
		
		//catch- go from child to parent not from parent to child(when we use multiple catches)
		
		int [] arr = new int[2];
		arr[0]=20;
		arr[1]=20;
		
	try {
		System.out.println(arr[10]); //ArrayIndexOutOfBoundsException
		System.out.println(10/0); // ArithmeticException ==> it wont work(like this not run) bcs in first
		// line the exception will come and then it go to catch ArrayIndexOutOfBoundsException
	}
		
		/*
		 catch(Exception e) { ==> // if we use  Exception first it shows the exception or error when we create a
		   multiple catch bcs -- exception is parent of all exception so we cannot go from parent to child in try and catch
		   but we can use exception for last catch bcs of child to parent
		*/
		
	catch(ArrayIndexOutOfBoundsException e) {
		System.out.println(e);
	}
		
		//catch(ArithmeticException e){ 
		// [or]
	catch(Exception e) {
		System.out.println(e.getMessage());
	}
	System.out.println("end program");
	

	}

}
