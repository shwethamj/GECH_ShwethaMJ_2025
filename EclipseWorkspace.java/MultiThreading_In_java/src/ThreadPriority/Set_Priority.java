package ThreadPriority;

class MyThread1 implements Runnable{

	@Override
	public void run() {
		System.out.println("child thread");
		System.out.println("name of child thread : "+Thread.currentThread().getName());
		System.out.println("priority of child : "+Thread.currentThread().getPriority());
	}	
}

public class Set_Priority {

	public static void main(String[] args) {
		MyThread1 myThread =  new MyThread1();
		Thread thread = new Thread(myThread);
		
		thread.setPriority(9); //set priority to child thread -->heihest priority executes first
//		thread.setPriority(17);//IllegalArgumnetException --> priorty between 1- 10 only
		
		thread.start();
		
		/*
		 * Priority is a suggestion to the thread scheduler; 
		 	it’s not guaranteed that a higher priority thread will always execute first. It depends on the OS and JVM implementation.
		 * Without join(), you may see the main thread printing first, even if the child has higher priority.
		 
		 * ✅ What start() does
				thread.start() tells the JVM to create a new thread and call its run() method asynchronously.
				It does not block the main thread; it returns immediately after scheduling the new thread.
				
			✅ What join() does
				thread.join() makes the calling thread (main) wait until the target thread (thread) completes its execution.
				If you call join() before start(), it will do nothing because the thread hasn’t even started.
					
		 */
		try { 
			thread.join();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("main thread");
		System.out.println("main thread name : "+Thread.currentThread().getName());
		System.out.println("priority of main : "+Thread.currentThread().getPriority());
	
	}
}
