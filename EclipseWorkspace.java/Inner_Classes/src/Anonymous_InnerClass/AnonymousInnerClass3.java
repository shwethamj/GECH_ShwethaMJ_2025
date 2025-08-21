package Anonymous_InnerClass;

//Anonymous inner class for interface(runnable)
public class AnonymousInnerClass3 {

	public static void main(String[] args) {
	
		//Runnable --> is anonymous innertype
		 Runnable run = new Runnable() {
			 
	            @Override
	            public void run() {
	                for (int i = 0; i < 5; i++) {
	                    System.out.println("child thread");
	                }
	            }
	        };

	        Thread th = new Thread(run); // Passing runnable obj to Thread
	        th.start();

	        for (int i = 0; i < 5; i++) {
	            System.out.println("main method");
	        }
	        
	        //output is unorder both main method and runnable method start at same time
	}
}

