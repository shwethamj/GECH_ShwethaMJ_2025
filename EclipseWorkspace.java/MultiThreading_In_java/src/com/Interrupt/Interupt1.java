package com.Interrupt;

class Mythread extends Thread{

	@Override
	public void run() {
		try {
			for(int i=1;i<5;i++) {
				System.out.println("thread runnning.... iterartion "+i);
				Thread.sleep(1000);
			}
			
		} catch (InterruptedException e) {
			System.out.println("thread was interputed by main methdo ! Cleaning Up....... ");
			
		}
		System.out.println("Thread ends");
	}
	
}
public class Interupt1 {
	/*
	 * to interupt any sleeping method 
	 * target method need to be in sleep state
	 
	 *o/p :
		thread runnning.... iterartion 1
		thread runnning.... iterartion 2
		thread runnning.... iterartion 3
		main thread interrupts child thraed .
		thread was interputed by main methdo ! Cleaning Up....... 
		Thread ends
		
	* here first the child thread executes by 1sec delay and main thread will wait(or in sleep) to 3 sec after that it will
		iterrupt(stop) the child thread execution( present in try) ,executes main thread and executes catch in child 
	 */
	
	public static void main(String[] args) {
		Mythread t = new Mythread();
		t.start();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		
		System.out.println("main thread interrupts child thraed .");
		t.interrupt(); //iterrupt the thread
	}
}
