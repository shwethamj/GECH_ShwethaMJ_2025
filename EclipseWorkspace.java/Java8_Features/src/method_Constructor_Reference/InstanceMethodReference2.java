package method_Constructor_Reference;

import java.util.Arrays;

public class InstanceMethodReference2 {

	public static void main(String[] args) {
		//wothout refrence
		String[] names = {"mohan","shwetha","abhi","Akash"};
		Arrays.sort(names,(a,b)-> a.compareToIgnoreCase(b));
		System.out.println("without refrence : "+ Arrays.toString(names));
	
		//with reference  
		//compareToIgnoreCase is instanceMethod present in String Class
		String[] names1 = {"mohan","shwetha","abhi","Akash"};
		Arrays.sort(names1,String ::compareToIgnoreCase);
		System.out.println("with refrence : "+ Arrays.toString(names1));
	
	}
}
