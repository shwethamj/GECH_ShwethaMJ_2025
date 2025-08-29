package multithreading_In_java;

class Parent1 extends Thread{

	@Override
	public void start() {
		super.start(); //calling parent method
		for(int i=0;i<5;i++) {
			System.out.println("start method");
		}
	}
	
}
public class CreatingThread5 { 
	/*
	 * case7: overriding start() method and when we call super.start():
	    =================================================
			o/p is  expected.
			
		case8: life cycle of thread:
		============================
		new/born thread create --> when t.start() ----------> run/runnable state  
											
		if thread scheduler allocates processor ----------->  running state
		
		if run() method completed --------->  dead state
		 
	 */

	public static void main(String[] args) {
		Parent1 p = new Parent1();
		p.start(); //here it  create a new thread and it call the start method as normal method
		
		for(int i=0;i<5;i++) {
			System.out.println("main method");
		}
	}
	
}
