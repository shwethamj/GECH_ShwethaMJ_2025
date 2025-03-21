package stringInJava;

public class StringMethod {
	public static void main(String[] args) {
		// String Methods:
		
		/*
		 * 1.equals
		 * 2.==
		 * 3.compareTo
		 * 4.toUpperCase
		 * 5.toLowerCase
		 * 6.trim
		 * 7.concat
		 * 8.startsWith
		 * 9.endsWith
		 * 10.strip
		 * 11.equalsignorecase
		 * 12.isBlank()
		 */
		
		String str1 = new String("hello world");
		String str2= new String("HELLo world");
		String str3= new String(" world");
				
		//1. equals
		System.out.println("equals:"+str1.equals(str2));
		
		//2.equalignorecase -- ignore upper case and lowercase only check the characters
		System.out.println("equalignorecase:;"+str1.equalsIgnoreCase(str2));
		System.out.println();
	
		//3. ==
		System.out.println("==:"+(str1==str2));
		System.out.println();
		
		//4. concat
		System.out.println("cocat:"+str1.concat(str2));
		System.out.println();
		
		//5.toUpperCase
		System.out.println("touppercase:"+str1.toUpperCase());
		System.out.println();
		
		//6.toLowerCase
		System.out.println("tolowercase:"+str2.toLowerCase());
		System.out.println();
		
		//7.compareTo
		System.out.println("compare:"+str1.compareTo(str2));
		System.out.println();
		
		//8.startsWith
		System.out.println("startswith:"+str1.startsWith(str2));
		System.out.println();
		
		//9.endsWith
		System.out.println("endswith:"+str1.endsWith(str3));
		System.out.println();
		
		//10.strip
		System.out.println("strip:"+str2.strip());
		System.out.println();
		
		//11.isBlank
		System.out.println("isBlank:"+str1.isBlank());
		System.out.println();
	}
}
