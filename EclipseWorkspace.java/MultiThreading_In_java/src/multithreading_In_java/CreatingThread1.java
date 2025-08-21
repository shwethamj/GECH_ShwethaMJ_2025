package multithreading_In_java;

class Mythread1 extends Thread{

	@Override
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println("child thread "+ (i+1));
		}
	}
}

public class CreatingThread1 {

	public static void main(String[] args) { //main thread
		Mythread1 th = new Mythread1();
		
	//one more thread(new) will created (child thread 1) and this thraed will call the run method
	//	th.start();
		
	//this not create the new thread it  will call run method  as normal method by main thread
		th.run(); 
		
		for(int i=0;i<5;i++) {
			System.out.println("main thread"); 
			}
		
		/*
		==> here i am calling th.run() first so it executes run method first and executes main thread next
		==> if i use th.run() after main thread for loop ==> it first excutes for loop and then prints run method
		==>here both run method and main thread for loop will handle by main thread only
		==>here main thread first call run method executes and after that it will print main thread
		
		*/
	}
}
