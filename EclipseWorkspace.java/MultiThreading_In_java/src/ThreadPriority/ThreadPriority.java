package ThreadPriority;

class MyThread implements Runnable{

	@Override
	public void run() {
		System.out.println("child thread");
		System.out.println("name of child thread : "+Thread.currentThread().getName());
		System.out.println("priority of child : "+Thread.currentThread().getPriority());
	}
	
}
public class ThreadPriority {
	/*
	 * thread priority:
	  	* giving priority to thraed ->based on that thread schedular will allocate proceeser
	  	* priority ==> 1-10
	  	* higher priority = 10 - executes first  
	  	* lower priority  = 1 - executes last
	  	* priority -> -1 and 11 / 12 --> runtime exception -- illegalArgumentException
	  	
	  	* main thread priority -- default -- 5
	  	* if we dont give priority to child thread -- by default it follows parent priority - 5
	 
	 			Default priorities:
					MIN_PRIORITY = 1	
					NORM_PRIORITY = 5
					MAX_PRIORITY = 10
	 */

	public static void main(String[] args) {
		MyThread myThread =  new MyThread();
		Thread thread = new Thread(myThread);
		thread.start();
		
		System.out.println("main thread");
		System.out.println("main thread name : "+Thread.currentThread().getName());
		System.out.println("priority of main : "+Thread.currentThread().getPriority());
	
	}
}
