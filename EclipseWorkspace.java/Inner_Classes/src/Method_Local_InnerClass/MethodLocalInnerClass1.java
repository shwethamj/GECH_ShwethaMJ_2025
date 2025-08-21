package Method_Local_InnerClass;

public class MethodLocalInnerClass1 {

	public int a =10;
	public static int b =30;
	
	public static void m1() {
		class Inner{
			public void m2() {
				System.out.println("this is inner method within inner class");
//			System.out.println(a+" "+b); // not allow a
				System.out.println(b);
			}
		}
		
		Inner in = new Inner();
		in.m2();
		
	}
	
	public static void main(String[] args) {
//		new MethodLocalInnerClass1().m1(); // for instance method		
		// can access both static and non static variabales
		
		MethodLocalInnerClass1.m1(); 
		//if method is static we can not access non static variables(instance variable)
	}
}
