package Gec_pacakge;

public class App {
	public static void main(String[]args) {
		//TODO Auto-generated method stub
		//variables
		//syntax -<access specifier -optional> <data type> variable_name;
		
		int a=30;
		System.out.println("hello world");
		System.out.println(a);
		
		//objects- it is a real world entity (it is exist in real word)
		// example- student,employee
		
		//object- contains 3 things
		/*
		 * 1.state
		 * 2.beh (behavior)-action
		 * 3.identity
		 */
		
		/*
		 * example:
		 * 40 students
		 * Identity-stdID or roll
		 * state-name.height,weight
		 * behavior- cansing(), canpaly()
		 */
		
		// class-it is a blueprint of an object
		
		
		/*
		 * class-will represent the state and behavior of an object
		 * class class_name{
		 * 			// state <access-specifier><data type>state_name;
		 * 			//beha -<access-specifier><return type>beh_name;
		 * 			//identity
		 * }
		 * 
		 * syntax to create a object
		 * 
		 * new class_name(name,weight,height);
		 */
		//user defined datatype below line and int a=30 is predefined datatype
		Student std = new Student(21,"shwetha");
			System.out.println(std.stdID);
			System.out.println(std.stdName);
			
		Student2 std2 = new Student2(34,"shwethu");
			System.out.println(std2.stdID);
			System.out.println(std2.stdName);
		
		
	}
}
