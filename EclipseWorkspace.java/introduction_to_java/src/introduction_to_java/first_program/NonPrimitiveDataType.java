package introduction_to_java.first_program;

import java.util.Scanner;

public class NonPrimitiveDataType {

	// types are - array, string,object,class,interface
	
	// array and string
	/*
	 * Array: stores multiple value
	 * 
	 * <datatype> arrayname={};
	 * 
	 */
	/*string
	 * String name="";
	 */
	public static void main(String[]args) {
		int[] array1= {1,2,3,4};
		System.out.println(array1[1]);
		
		String name="shwetha";
		System.out.println("enter name");
		Scanner sc= new Scanner(System.in);
		name= sc.next();
		System.out.println("Name is:"+name);
		
       //sc.next(); // it only read next one word (ex : entered name = shwetha mj == it only read or dislpay shwetha)
		//sc.nextLine() -- it read full line
		
		
		// student details example
		
		String Name,branch,address;
		byte age;
		double marks;
		char gender;
		
		
		System.out.println("enter the name ");
		Name=sc.nextLine();
		
		System.out.println("enter the age ");
		age=sc.nextByte();
		
		System.out.println("enter the marks ");
		marks=sc.nextDouble();
		
		sc.nextLine();
		System.out.println("enter the gender ");
		gender=sc.nextLine().charAt(0);
		
		System.out.println("enter the branch ");
		branch=sc.nextLine();
		
		
		System.out.println("enter the address ");
		address=sc.nextLine();
		
		System.out.println("student Name is:"+Name);
		System.out.println("student age is:"+age);
		System.out.println("student marks is:"+marks);
		System.out.println("student gender is:"+gender);
		System.out.println("student branch is:"+branch);
		System.out.println("student address is:"+address);
		
		
	}
}
