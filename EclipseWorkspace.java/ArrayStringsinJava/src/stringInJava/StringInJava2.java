package stringInJava;

public class StringInJava2 {

	public static void main(String[] args) {
		/*
		 1. mutability 
		 	String objects are immuatble . ince created thier content cannot be changed
		 */
	
		//String ==> immutable -- need to give reference to amke concat
		String str = new String("shwetha");
		str = str.concat(" M J");
		System.out.println("conactination : "+str); // op ==> shwetha m j
		
		 String str1 = new String("shwetha");
		 str1.concat(" M J");
		 System.out.println("conactination without giving reference  : "+str1);//op ==> shwetha
		 
		 //StringBuffer mutable -- no need to give reference to do conact automaticaly it works
		 StringBuffer str2 = new StringBuffer("shwetha");
		 str2.append(" M J");
		 System.out.println("conactination using string buffer  : "+str2);
		 
		 //StringBuilder mutable -- no need to give reference to do conact automaticaly it works
		 StringBuilder str3 = new StringBuilder("shwetha");
		 str3.append(" M J");
		 System.out.println("conactination using string builder  : "+str3);
	}
}
