package stringInJava;

import java.util.Arrays;

public class StringMethod {
	public static void main(String[] args) {
		
		/*
		 STRING METHOD :
		 =============
			 * 1.equals()
			 * 2. ==
			 * 3.compareTo
			 * 4.toUpperCase
			 * 5.toLowerCase
			 * 6.trim
			 * 7.concat
			 * 8.startsWith
			 * 9.endsWith
			 * 10.strip
			 * 11.equalsIgnorecase
			 * 12.isBlank()
			 * 13.length
			 * 14.charAt()
			 * 15. subString()

		 */
		
		String str1 = new String("hello world");
		String str2= new String("HELLo world");
		String str3= new String("hello world");
		String str4= new String("     hello world");
				
		//1. equals
		System.out.println("equals:"+str1.equals(str2)); //false
		System.out.println("equals:"+str1.equals(str3)); //true	
		
		//2.equalIgnoreCase -- ignore upper case and lower case only check the characters
		System.out.println("equalignorecase : "+str1.equalsIgnoreCase(str2)); //true
		System.out.println();
	
		//3. ==  //checks the memory location so it returns false if we compare 2 separate string(object)
		System.out.println("==:"+(str1==str2)); //false
		System.out.println("==:"+(str1==str3));//false
		System.out.println();
		
		//4. concat
		System.out.println("cocat:"+str1.concat(str2)); //hello worldHELLo world
		System.out.println();
		
		//trim ==>remove space in the starting of word
		System.out.println("cocat:"+str4.trim()); //hello world
		
		//5.toUpperCase
		System.out.println("touppercase:"+str1.toUpperCase()); //hello world ==> HELLO WORLD
		System.out.println();
		
		//6.toLowerCase
		System.out.println("tolowercase:"+str2.toLowerCase()); // HELLo world ==> hello world
		System.out.println();
		
		//7.compareTo  -- checks the bytes  
		System.out.println("compare:"+str1.compareTo(str2)); // 32
		System.out.println();

		
		//8.startsWith
		System.out.println("startswith:"+str1.startsWith(str2)); //false
		System.out.println("startswith:"+str1.startsWith("h")); //true
		System.out.println();
		
		//9.endsWith
		System.out.println("endswith:"+str1.endsWith(str3)); //true
		System.out.println();
		
		//10.strip
		System.out.println("strip:"+str2.strip());
		System.out.println();
		String	str5 = "shwetha m j " ;
		System.out.println("strip1 : "+str5.strip());
		
		//11.isBlank
		System.out.println("isBlank:"+str1.isBlank());
		System.out.println();
		
		//12.length()
		System.out.println("str1 length  : "+str1.length()); //no of char
		System.out.println();
		
		//13.CharAt()
		System.out.println(" cahracter in str1 by using index =>"+str1.charAt(1));
		System.out.println();
		
		
		//14.indexOf()
		System.out.println("indexOf : "+str1.indexOf('h'));
		System.out.println();
		
		
		//15. lastIndexOf()
		System.out.println("lastIndexOf : "+str1.lastIndexOf('l')); //2  L are there in hello it return index of last l
		System.out.println();
		
		
		//16. replace()
		System.out.println("replace of m in str5 as M : "+str5.replace("m", "M"));
		System.out.println();
		
		//17. split()
		String str6 = "happyhappy ";
		String [] str = str6.split("h");
		System.out.println("split of string 5 : "+Arrays.toString(str)); //[,appy, appy]
		System.out.println();
		
		//18.valueOf()
		int number =123;
		String strr = String.valueOf(number);
		System.out.println("value of number : "+strr); //123
		System.out.println();
		
		//19. intern()
		String str7 = "pavan";
		String str8 = new String("pavan"); //false → str8 is in heap, str7 is in String constant pool
		System.out.println(" == : "+(str7 == str8)); //false 
		
		String str9 = new String("pavan").intern(); // true → interned str9 points to pool(scp) version
		System.out.println("== using intern method : "+(str7 ==str9)); //true
	}
}
