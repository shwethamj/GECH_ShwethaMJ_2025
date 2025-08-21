package String;

public class PalindromeString {

	public static void main(String[] args) {
		String str ="gadag";
		
		System.out.println("string : "+str);
		
		String rev="";
		for(int i=str.length()-1;i>=0;i--) {
			 rev += str.charAt(i);	
		}
		
		System.out.println("reverse of string : "+rev);
		
		if(str.equals(rev)) {
			System.out.println("the string "+str + " is palindrome");
		}
		else {
			System.out.println("the string "+str + " is not palindrome");
		
		}
	}
}
