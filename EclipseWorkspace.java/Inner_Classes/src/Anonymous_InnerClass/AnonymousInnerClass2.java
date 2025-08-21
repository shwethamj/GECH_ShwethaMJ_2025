package Anonymous_InnerClass;

public class AnonymousInnerClass2 {
	
	/*
	 * Runnable ->functional interface have method - run
	 * Thread class Extends runnable --> & override the run method
	 */
	public static void main(String[] args) {
		//Anonymous class to create thread
		Thread th = new Thread() {
			
			@Override
			public void run() {
				for(int i =0;i<5;i++) {
					System.out.println("child thread");
				}
			}
			
		};
		
		th.start();
		for(int i =0;i<5;i++) {
			System.out.println("main method");
		}
		/*
		 * ✅ Execution flow

				main() -> starts running in the main thread.
				
				Thread th = new Thread() { ... } creates an anonymous class that extends Thread and overrides run().
				
				th.start() :  JVM creates a new thread.
				
				The new thread executes the overridden run() method.
				
				Main thread continues and prints "main method".
				
				Both threads run concurrently, so output is interleaved.
				 */
	}
}
