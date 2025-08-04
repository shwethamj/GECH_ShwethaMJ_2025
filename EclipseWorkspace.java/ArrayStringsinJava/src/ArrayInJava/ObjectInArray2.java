package ArrayInJava;

import java.util.Scanner;

class Teacher{
	String name;
	int roll;
}
public class ObjectInArray2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("eneter size of array");
		int n= sc.nextInt();
		
		Teacher[] teach =new Teacher[n]; //array craeted
		
		System.out.println("enter "+n + " name and roll");
		for(int i=0;i<n;i++) {
			teach[i] =new Teacher(); //object created
			teach[i].name= sc.next();
			teach[i].roll=sc.nextInt();
			
		}
		
		for(int i=0;i<n;i++) {
			System.out.println("the name : "+teach[i].name+ " and  roll: "+teach[i].roll );
		}
		
	}
}
