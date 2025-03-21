package stringInJava;

public class StringInJava {
	
	public static void main(String[] args) {
		/*
		 * STRING: is a group of characters
		 
		 *ex:table;
		 *==> character need to close within "";
		 *ex: "table";
		 
		 * how to declare the String;
		 
		 *1. USING STRING LITERAL:
		 *String var_name="String_name";
		 
		  *2. using new keyword:
		  *String var_name= new String("string_name");
		 
		 */
		
		String name="shwetha";
		String age=new String("shwetha");
		String age1=new String("shwetha");// new is object
		String name1="shwetha";
		System.out.println(name);
		System.out.println(age);
		System.out.println(age1);
		System.out.println("-------------------------------------\n");
		System.out.println(name.equals(age)); //checking for values using .equal //false
		System.out.println("-------------------------------------");
		System.out.println(name==(age)); //it check for refernce/address // false
		// if it check for reference like shwetha store in name and name1
		// but new keyword it create a new separate objects for age and age1
		
		System.out.println("-------------------------------------");
		System.out.println(name==(name1)); //true
		
		System.out.println("-------------------------------------");
		//Strings are immutable
		String str5 = new String("String5");
		str5 =str5.concat("hello");
		// str5.concat("hello) -- if we dont use str_name it will not concat with String5
		System.out.println(str5);
		
		
	}

}
