package String;

public class ReverseString {

	public static void main(String[] args) {
		String str ="shwetha";
		
		System.out.println("string : "+str);
		
		String rev="";
		for(int i=str.length()-1;i>=0;i--) {
			 rev += str.charAt(i);	
		}
		
		System.out.println("reverse of string : "+rev);
	}
}
