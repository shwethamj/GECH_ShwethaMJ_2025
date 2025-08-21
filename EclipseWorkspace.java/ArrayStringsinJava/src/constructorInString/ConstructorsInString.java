package constructorInString;

public class ConstructorsInString {

	/*
	 STRING CONSTRUCTOR IN JAVA
	 ======================
	 */
	public static void main(String[] args) {
		
		String str =new String(); //here constructer named  String  will call automatically .
		System.out.println("string 1 : "+str); //if we dont assign value constructor will give empty ("")
		
		str = "shwetha";
		System.out.println("string 1  sfter assigning value: "+str);
		
		String str1 = new String ("murali");
		System.out.println("string 2  : "+str1);
		
		char[] arr = {'a','b','c'};
		String str3 = new String(arr); //character constructor will called and convert character to String
		System.out.println(" character constructor :  "+str3);
		
		byte[] arr1 = {65,97,66,98,67}; //Assci value
		String str4 =new String(arr1);//byte constructor will called and convert assci value to string
		System.out.println("byte constructor : "+str4); 
		
		
		StringBuffer sb = new StringBuffer("s1234556");
		String str5 = new String(sb);
		System.out.println("string buffer : "+str5);
	}
	
}
