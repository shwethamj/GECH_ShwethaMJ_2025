package Static_InnerClass;

//it contains the static nested inner class inside one outside class
//we can access only the static members of the outer class.
//we can create object using the Outer.Inner 
//we can't be able to access the non-static members of the outer class in the inner class method. 
class Outer {
	public static String message = "Hello";
	public String name = "Swathu";

	static class Inner {
		public void display() {
			System.out.println(message);
//			System.out.println(name);
		}
	}

}

public class StaticInnerClass3 {

	public static void main(String[] args) {
//		Inner in=new Inner(); here we cannot create obj directly to inner class
		
		//need to use outerclass(parent class)
		Outer.Inner obj = new Outer.Inner();
		obj.display();

	}

}