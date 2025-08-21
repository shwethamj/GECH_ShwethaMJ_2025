package Method_Local_InnerClass;

public class MethodLocalInnerClass {

	//to achieve method nested -- MethodLocalInnerClass
	// in java it don't allow nested method - allows inner class
	public void m1() {
		class Inner{
			public void m2() {
				System.out.println("this is inner method within inner class");
			}
		}
		//creating obj for inner class within outermethod
		Inner in = new Inner();
		in.m2();
		System.out.println("this is outer method ");
	}
	
	public static void main(String[] args) {
		MethodLocalInnerClass met = new MethodLocalInnerClass();
		met.m1();
		
		//or  --> if method is static
		// MethodLocalInnerClass.m1(); or m1();
		
	}
}
