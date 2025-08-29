package synchronization_In_Java;

class Display{
	public synchronized void wish(String name) {
		for(int i=0;i<5;i++) {
			System.out.println("good morning : ");
		
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(name);
		}
	
	}
}

class mythread extends Thread{
	Display d; //creating variable of class display
	String name;
	
	//constructor
	 mythread(Display d, String name) { //passing Display class object and name
		super();
		this.d = d;
		this.name = name;
	}
	
	 public void run() {
		 d.wish(name); //calling the wish method of display and passing name as argumnet to whish
	 }
	
}
public class Synchronization1 {

	/*
	 * Synchronized
	 ==============
	  the one thread will occupy the method(other thread will go to waiting state) and excutes first and after it completely executes method
	  then only the next thread will occupy the method 
	 */
	public static void main(String[] args) {
		Display d = new Display();
		mythread  mythread = new mythread(d, "shwetha");
	
		mythread  mythread1 = new mythread(d, "nitya");
		
		mythread.start();
		mythread1.start();
	}
	
}
