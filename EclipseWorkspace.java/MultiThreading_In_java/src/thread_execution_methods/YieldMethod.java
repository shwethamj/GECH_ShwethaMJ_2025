package thread_execution_methods;

class MyThread implements Runnable{

	@Override
	public void run() {
		for(int i =0;i<5;i++) {
			System.out.println("child thread");
			Thread.yield();
		}
		
	}
	
}
public class YieldMethod {

	/*
	 * Yield Method
	 ===============
	 	if i use yield method in child --> the run method will go to run/runnable state
	 	
	 ==> o/p here child thread always yield() now main will more chance than child thread.
	 ==>o/p-2 ==> atleast one or more times the main method will executes first and then both child and main executes concurrently(bcs both have same priority =5) ==>unpredictable
	 
	 *
	 1. yield:
		=========
		* cause too pause the current executing thread to give the chance for waiting threads of same priority. if there is no waiting thread or all waiting threads have low priority then same thread can continue ots exception.
		
		* If multiple threads are waiting with same priority then which waiting thread will get a chance we can't expect it depends on thread seceduler.
		
		* if two thread have same priority --> it works --> declare yield method in child then work as o/p-2
			==>if multiple thread are waiting with same priority --> execution depends on thread schedular
			==> with different priority --> works on priority
		
		
		
		* prototype:
		============
		public static native void yield(); - native means not implemented in java.
		
														Thread.yeild()
															|      |
		new/born thread  t.start() ----------> run/runnable state  |
						 					 			|          |
		if thread scheduler allocates processor ----->  running state
	
		if run() method completed -----> dead state
	 
	 */
	public static void main(String[] args) {
		MyThread myThread = new MyThread();
		Thread thread = new Thread(myThread);
		thread.start();
		
		for(int i =0;i<5;i++) {
			System.out.println("main thread");
		}
		
	}
}
