package com.runnable_interface;

class NameOfThread1 implements Runnable{

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName());
		
	}
	
}
public class Setting_ThreadName {

	public static void main(String[] args) {
		
		NameOfThread1 nm = new NameOfThread1();
		Thread th = new Thread(nm);
		th.setName("childThead1"); //seeting name for thread0(default name) as childThraed1
		th.start();//childThead1
		
		Thread th1 = new Thread(nm);
		th1.start();//thread1
		
		Thread th2 = new Thread(nm);
		th2.start();
		
		System.out.println("before setting name for main Thread: "+Thread.currentThread().getName());
		Thread.currentThread().setName("Hello Main");//setting anem for main thread
		
		
		System.out.println("after setting name main Thread : "+ Thread.currentThread().getName());

	}
}
