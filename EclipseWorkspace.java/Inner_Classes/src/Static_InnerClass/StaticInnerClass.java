package Static_InnerClass;

public class StaticInnerClass {

	static class Inner{
		public void main() {
			System.out.println("helo");
		}
	}
	
	public static void main(String[] args) { 
		//by creating obj to inner class
		Inner i =new Inner();
		i.main();
	
		//or by using Outer class name creating object for static Innerclass
		StaticInnerClass.Inner n = new StaticInnerClass.Inner();
		n.main();
	}
}
