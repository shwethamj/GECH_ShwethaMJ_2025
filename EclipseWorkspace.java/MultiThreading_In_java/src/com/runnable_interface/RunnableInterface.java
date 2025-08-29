package com.runnable_interface;

/*by extending runnable interface
//java doesnot support multithreading so we use runnable interface
in java extending multiple class is not possible ,and implementing multiple inneheritnce is possible 
*/
class ThreadClass implements Runnable{

	@Override
	public void run() {
		for(int i =0;i<5;i++) {
			System.out.println("child thread");
		}
	}
	
	public void start() { //it is normal method created by us
		System.out.println("start method");
	}
	
}

public class RunnableInterface {

	public static void main(String[] args) {
		ThreadClass class1 = new ThreadClass();
		Thread th = new Thread(class1);
		th.start();//method present in thread class
		
		Thread th1 = new Thread();//here not passing runnable so
		th1.run(); //gives empty
		
		class1.start();//it will call normal method
		
		for(int i =0;i<5;i++) {
			System.out.println("main thread");
		}
	}
}
