package Method_Local_InnerClass;

// Inner class --> can access the local variables
public class MethodLocalInnerClass2 {
/*
 * the inner class cannot be public -> its in the method so we can access that only within the method
 * method scope -> can belong to method only
 */
	public int a =10;
	public static int b =30;
	
	public  void m1() {
		int z=0;
		class Inner{ 
			int z1=10;
			public void m2() {
				System.out.println("this is inner method within inner class");
			    System.out.println(a+" "+z1 +" "+z); 
				
			}
		}
		
		Inner in = new Inner();
		in.m2();
		
	}
	
	public static void main(String[] args) {
		new MethodLocalInnerClass2().m1();
	}
}
