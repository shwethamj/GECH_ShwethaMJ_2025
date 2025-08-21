package multithreading_In_java;

class Parent extends Thread{

	@Override
	public void start() {
		for(int i=0;i<5;i++) {
			System.out.println("start method");
		}
	}
}
public class CreatingThread4 {

	public static void main(String[] args) {
		Parent p = new Parent();
		p.start(); //here it wont create a new thread andit call the start method as normal method
		
		for(int i=0;i<5;i++) {
			System.out.println("main method");
		}
		/*
		  case6: overriding start() method:
			=================================
			* it will be executed just like normale method call.
			* it is not recommended.
			
			* here the order o/p --> it prints the value in start method first then main method loop -->bcs i declared p.start  before main for loop
			
		 */
	}
}
