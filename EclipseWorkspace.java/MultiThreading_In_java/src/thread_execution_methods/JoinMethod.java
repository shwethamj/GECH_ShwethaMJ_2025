package thread_execution_methods;

class Mythread implements Runnable{

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName()+" staeted execution");
		for(int  i=0;i<5;i++) {
			System.out.println("child thread : "+(i+1));
			
			try {
				Thread.sleep(2000); // = 2sec ==> child thread print one after one with gap 2 second
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");
	}
}

public class JoinMethod {

	/*
	 * if the thread2(main) to need wait until execution of thread1(child) --> call thread1.join() in thraed2(main) 
	 	use thread.join() --> it will Unhandled exception type InterruptedException -->use try catch or throws
	 
	 *here example of main calling a join on child thread ->child thread executes first then main thread

	Differences:
	============
	1. Yeild(): if a thread wants to pause its execution to give the chance for tha remain threads of same priority then go for yeild().
	
	2. Join(): if a thread wants to wait until completing some other thread then we should go for join method.
	
	3. if a thread don't perform any operaion per a perticular amount of tim then we should for for sleep method.

	 */
	public static void main(String[] args) {
		Thread thread = new Thread(new Mythread());
		thread.start();
		
		try {
			thread.join();
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		
		System.out.println(Thread.currentThread().getName()+" started execution");
		for(int  i=0;i<5;i++) {
			System.out.println("main thread : "+(i+1));
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");

	}
}
