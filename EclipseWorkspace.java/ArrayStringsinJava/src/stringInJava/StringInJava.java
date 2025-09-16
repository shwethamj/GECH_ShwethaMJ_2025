package stringInJava;

public class StringInJava {
	
	public static void main(String[] args) {
		/*
		  STRING:
		  =======
		 *  it is a object 
		 *  that represent a group of characters /array of character / sequence of character
		 *  String is final class that cannot  extends to other and we can create a object
		 *  ==> character need to close within ""; ==>  ex :"table"
		 Syntax:
		 ========
		 
		 	1. USING STRING LITERAL :
		 		String var_name = "value"; // String literals ->this will only  create if object doesn't exist
		 	
		 	2. using new keyword:
		 		String var_name = new String("value"); //craete  A new object every time.
		
		Object ==> is the father of all objects(which we create)
		whe 
		 */
		
		String str1="shwetha";
		String str2= "shwetha";
		
		String str3=new String("shwetha");
		String str4=new String("shwetha");
		
		System.out.println("string 1 :"+str1);
		System.out.println("string 2 :"+str2);
		System.out.println("string 3 :"+str3);
		System.out.println("string 4 :"+str4);
		System.out.println("=============================================================");
		
		/*
		 * String Comparision :
		  ==================
		  	1. ==  -> reference comparision
		  	2. equals() -> checks value 
		  	3. compareTo -> based on bytes 
		  		if 2 strings equal -> 0
		  		if 1st strings greater than second ->  >0
		  		if 1st strings lesser than second ->  <0
		 */
		
		//using ==
		System.out.println("str1 == str2 : "+(str1 == str2));//true this will compare the reference // true
		System.out.println("str1 == str2 : "+(str1 == str3)); //false
		System.out.println("str1 == str2 : "+(str1 == str4)); //false
		System.out.println("--------------------------------------------------");
		
		// using .equals
		System.out.println("str1 = str2  : "+str1.equals(str2));
		System.out.println("str1 = str3  : "+str1.equals(str3));
		System.out.println("str1 = str3  : "+str1.equals(str4));
		System.out.println("-------------------------------------");
		
		//using compareTo
		System.out.println("str1 = str2  : "+str1.compareTo(str2));
		System.out.println("str1 = str3  : "+str1.compareTo(str3));
		System.out.println("str1 = str3  : "+str1.compareTo(str4));
		System.out.println("-------------------------------------");

		
		// String comparison using == (with final and without final) 
		String arr = "123456"; //string literal stored in string constant pool
		final String arr2 = "123"; // This is a constant, known at compile time.
		String arr3 = "123";  //This is not final, so Java cannot optimize it at compile time.
		 
		String arr4 = arr2 + "456"; // Evaluated at compile time → "123456"
		String arr5 = arr3 +"456"; // A new object is created in the heap (not from the constant pool).
		
		System.out.println(arr == arr5);//false
		System.out.println(arr == arr4);//true	
		
	}

}
