package multithreading_In_java;

//if run method not override
class ParentThread extends Thread{
	
}

public class CreatingThread2 {

	public static void main(String[] args) {
		ParentThread th = new ParentThread();
		th.start();
		//it will execute and give empty bcs we are not override the run method
	}
}
