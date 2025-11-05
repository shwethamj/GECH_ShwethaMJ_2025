package exceptionInJava;

public class ErrorInJava {

	public static void Display() {
		Display(); //this will call repeatedly the display method
	}
	
	private static int fact(int i) {
		return i*fact(i-1); //base condition need to write in function so here like if(fact = 1 or 0) return 1;
	}

	
	public static void main(String[] args) {
		
		/*
		 ERROR:
		 =======
			 * it is a problem where the programmer cannot handle it 
			 * ex: stackOverflow error
		 */
		ErrorInJava.Display(); //stack overflow
		
		
		int res = fact(3);
		System.out.println(res);  // stackOverflow error
		
	}
	
	
}
