package multithreading_In_java;

//by extending the thread class

	/*
	 * start() -->heart of multithreading
	 * and needed to declare start method for each 
	 * it will register task with thread schedular so it important to decalre start() method
	 */

class Mythread extends Thread{

	@Override
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println("child thread "+ (i+1));
		}
	}
}

public class CreatingThread {

	public static void main(String[] args) { //main thread
		Mythread th = new Mythread();
		
		th.start();//one more thread will created (child thread 1) and call the run method 
		System.out.println("main thread");//this will execute by main thread
		
		/*
		  case3: importance if thread class start method:
		  ===============================================
			* Thread class start method is responsible to register with the Thread Scheduler & all other manditary activities hence without executing the Thread class start() method there is no chance of starting a new thread in java
			* due to this thread class "start()" method is considered as heart of multithreading.

		 */
		//both main thread and new child thread will execute concurrently -->cannot predict output
	}
}
