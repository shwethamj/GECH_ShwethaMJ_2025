package thread_execution_methods;

class Mythread3 implements Runnable{

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName()+" staeted execution");
		for(int  i=0;i<5;i++) {
			System.out.println("child thread : "+(i+1));
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");
	
	}
}

public class SleepMethod {

	/*
	 * Sleep();
	  ==========
	  	pause the execution of thread -->then sleep(1000)- 1sec delay
	  	when for sometime the exceution need to delay or pause in sec
	  	1000 ms=1 sec
	  	1ms = 10,000 nano sec
	 */
	
	public static void main(String[] args) {
		Thread thread = new Thread(new Mythread3());
		thread.start();

		try {
			thread.sleep(5000); // 5sec delay
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		
		System.out.println(Thread.currentThread().getName()+" started execution");
		for(int  i=0;i<5;i++) {
			System.out.println("main thread : "+(i+1));
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");

		//o/p ==> child method executes first completely and it take 5 sec after 5sec main method will print 
	}
}
