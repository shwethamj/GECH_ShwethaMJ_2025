package multithreading_In_java;

//if run method not override
class ParentThread extends Thread{
	
}

public class CreatingThread2 {

	public static void main(String[] args) {
		ParentThread th = new ParentThread();
		th.start();
		//it will execute and give empty bcs we are not override the run method
	
	/*
	 	case1:Thread Scheduler:
		========================
	 	 It is responsible for schedule the threads i,e if multiple threads are waiting to get a chance of execution
	 	  then in which order threads will be executed is decided by thread scheduler

		case5: if we not override run method:
		=====================================
			class MyThread extends Thread{
				
			}
		 Thread class run method will be executed which as empty implementation. Hence we won't get any o/p.

	 */
	}
}
