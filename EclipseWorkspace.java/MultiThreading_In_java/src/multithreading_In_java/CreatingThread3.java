package multithreading_In_java;

class Mythread2 extends Thread{

	@Override
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println("child thread "+ (i+1));
		}
	}
	
	//overloading
	public void run(int n) {
		for(int i=0;i<5;i++) {
			System.out.println("child thread11 "+ (i+1));
		}
	}
	
	
	public void run(String s) {
		for(int i=0;i<5;i++) {
			System.out.println("child thread12 "+ (i+1));
		}
	}
}

public class CreatingThread3 {
	
	public static void main(String[] args) {
		Mythread2 th = new Mythread2();
		th.start();// it will create new thread and call run method without parameter only and always
		
		//if want to call other overloaded methods of run
		th.run(78);
		th.run("shwetha");
		
		//unordered output
	}
	
	

}
