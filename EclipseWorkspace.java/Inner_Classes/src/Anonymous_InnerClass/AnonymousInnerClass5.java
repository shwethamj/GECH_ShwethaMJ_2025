package Anonymous_InnerClass;

//Anonymous inner class in argument
public class AnonymousInnerClass5 {

	public static void main(String[] args) {
		//passing anonymous inner class as a argument
		Thread th = new Thread(new Runnable() {
			
			 @Override
	            public void run() {
	                for (int i = 0; i < 5; i++) {
	                    System.out.println("child thread");
	                }
	            }
		});
		
		th.start();
		for (int i = 0; i < 5; i++) {
            System.out.println("main method"); //its print first
        }
        
		//here the main() thread loop will print first(main method)
		// after completing that it will print the child thread
	}
}
