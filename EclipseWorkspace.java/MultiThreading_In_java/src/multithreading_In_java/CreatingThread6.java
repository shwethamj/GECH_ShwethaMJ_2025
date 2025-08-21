package multithreading_In_java;

class Mythread3 extends Thread{

	@Override
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println("child thread "+ (i+1));
		}
	}
}
public class CreatingThread6 {

	/*
	 * case9:Imp
	    ========
		After starting a thread if we are trying to restart same thread then we will get RE(runtime exception) saying illegalThreadStateException. 
	 */
	public static void main(String[] args) {
		Mythread3 my = new Mythread3();
		my.start();
		my.start();
	}
}
