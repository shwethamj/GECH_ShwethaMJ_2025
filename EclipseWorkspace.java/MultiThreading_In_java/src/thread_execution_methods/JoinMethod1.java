package thread_execution_methods;

class Mythread1 implements Runnable{

	static Thread mt;
	
	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName()+" started execution");
		
		try {
			mt.join(); // calling main method 
			} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		for(int  i=0;i<5;i++) {
			System.out.println("child thread : "+(i+1));	
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");
	}
}
public class JoinMethod1 {
	/*
	 * main method will execute after above line and after completing that child going to executs
		o/p ==> thread0 started then main method executes completely and then the remaing in child method
	 
	 * here example of child calling a join on main thread ->main thread executes first then child thread
	 
	 * if main method call join on child and child call join on main that cause stucking called -->deadlock
	 */
	
	public static void main(String[] args) {
		Mythread1.mt = Thread.currentThread();//main thread passing to mt
		
		Thread thread = new Thread(new Mythread1());
		thread.start();
		
		System.out.println(Thread.currentThread().getName()+" started execution");
		for(int  i=0;i<5;i++) {
			System.out.println("main thread : "+(i+1));
		}
		System.out.println(Thread.currentThread().getName()+" completed execution");

	}

}
