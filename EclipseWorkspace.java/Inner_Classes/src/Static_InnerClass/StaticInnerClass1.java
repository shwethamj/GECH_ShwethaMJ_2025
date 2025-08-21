package Static_InnerClass;

public class StaticInnerClass1 {

	//cannot access instance variable of parent in static inner class - only static variable
	    static String outerStatic = "Outer Static";
	    String outerInstance = "Outer Instance";

	    static class Inner {
	        void display() {
	            // ✅ Allowed (Outer static variable)
	            System.out.println("Static: " + outerStatic);

	            // ❌ Not allowed: outerInstance
	            // System.out.println(outerInstance); // Compile-time error
	        }
	    }

	    public static void main(String[] args) {
	        Inner inner = new Inner();
	        inner.display();
	   
	  }
	

}
