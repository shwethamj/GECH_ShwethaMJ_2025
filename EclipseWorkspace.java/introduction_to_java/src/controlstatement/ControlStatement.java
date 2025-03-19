package controlstatement;

public class ControlStatement {

	public static void main(String[]args) {
		/*
		 * if,if else, else if and switch statement
		 
		 * if(condition){
		 * }
		 
		
		 * if(condition){
		 * }
		 * else{
		 * }
		 
		 *  if(condition){
		 * }
		 * else if(condition){
		 * }
		 * else{
		 * }
		 */
		
		int a=30;
		int b=30;
		
		System.out.println("output is::\n");
		
		//1.if
		if(a==30) {
			System.out.println("a is equal to 30");
		}
		System.out.println("---------------------------------------");
		
		//2. if else
		if(a>=20) {
			System.out.println("a is greater than 20");
		}
		else {
			System.out.println("a is less than 20");
		}
		System.out.println("---------------------------------------");
		
		
		//3.else if
		
		if(a>b) {
			System.out.println("a is greater than b");
		}
		else if(b>a) {
			System.out.println("a is leeser than b");
		}
		else {
			System.out.println("a is equal to  b");
		}
		System.out.println("---------------------------------------");
		
		//4.Switch 
		// this below type used from 1 to 4 version of java
		
		int day=2;
		switch(day) {
		case 1:{
			System.out.println("monday");
			break;
		}
		case 2:{
			System.out.println("Tuesday");
			break;
		}
		case 3:{
			System.out.println("wednesday");
			break;
		}
		case 4:{
			System.out.println("thursday");
			break;
		}
		case 5:{
			System.out.println("friday");
			break;
		}
		case 6:{
			System.out.println("saturday");
			break;
		}
		case 7:{
			System.out.println("sunday");
			break;
		}
		}
		System.out.println("---------------------------------------");
	}
}
