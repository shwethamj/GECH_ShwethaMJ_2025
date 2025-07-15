package var;

public class Variable {

	public static void main(String[] args) {
		// var keyword can also be used to create variables and can store any type of
		// datatypes. instead of int, double, String var_name,
		int a = 10;
		var a1 = "Hello";
		for (var i = 0; i < 7; i++) {
			System.out.println(a);
		}
		var b =  "1, 2, 3, 4, 5 ";
		
		
		int num=15;
		int num1=17;
		
		System.out.println(num);
		System.out.println(num1);
		
		int temp =num;
		num=num1;
		 num1=temp;
		
		System.out.println(num);
		System.out.println(num1);
		
	}
	
	

//	ctrl+shift+o = to remove unwanted imports
	// ctrl+shift+f - to format the document
}
