package functionsinjava;

public class Functions {
	
	//1. function return and accepting value
	public int add(int a, int b) {
		return a+b;
	}
	//2.function not return but accepting parameter (sub is function name)
	public void sub(int a, int b) {
		System.out.println(a+b);
	}
	
	//3. function return and not accepting parameter
	public int mul(int a, int b) {
	     return a+b;
	}
	
	
	//4 function not return and not accepting parameter
	public void adding() {
		System.out.println("not accepting anything");
	}
	
	
	public static void main(String[] args) {
		
		//functions/methods in java
		
		/*
		 * <access modifier> return type function_name(parameters){
		 *  //code
		 *  }
		 * public void add(int a,int b)
		 * syso(a+b);
		 * }
		 
		 *two types:
		 *1.built-in =>next(),nextLine(),println()l equals()
		 *2. user-defined
		 *3.function return a value not accepting parameter
		 *4.function return a value and accepting parameter
		 *5.function not return a value not accepting parameter
		 *6.function  not return a value but accepting parameter
		 */
		
		//1. function return a value and accepting parameter
		 Functions obj =new Functions();
		 int res = obj.add(20,30);
		 System.out.println("output is:"+res);
		
		 
		 //2.function not return and accepting parameter
		 int res1=obj.add(10, 20);
		 System.out.println("output2 is:"+res1);
		 
		 
		 
	}

}
