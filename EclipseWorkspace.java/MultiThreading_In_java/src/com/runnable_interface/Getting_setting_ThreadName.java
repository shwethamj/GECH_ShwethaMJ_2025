package com.runnable_interface;

class NameOfThread implements Runnable{

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName());
		System.out.println(10/0); 
		//Exception in thread "Thread-0" - Exception in thread "Thread-1" Thread-2
		//Exception in thread "Thread-2"
	}
	
}
public class Getting_setting_ThreadName {
	/*
	 * every thraed has a name
	 * by default jvm will give a thread name 
	 * and programmer can also give name to thread
	 * 
	 * main thread name --> default - main
	 * first thread name --> default - thread0
	 * second thread name --> default - thread1
	 */
	public static void main(String[] args) {
		
		NameOfThread nm = new NameOfThread();
		Thread th = new Thread(nm);
		th.start();//thread0
		
		Thread th1 = new Thread(nm);
		th1.start();//thread1
		
		Thread th2 = new Thread(nm);
		th2.start();
		
		System.out.println(Thread.currentThread().getName());
		System.out.println(10/0); 
		// Exception in thread "main"(name of thread - jvm ) java.lang.ArithmeticException: / by zero
	}

}

