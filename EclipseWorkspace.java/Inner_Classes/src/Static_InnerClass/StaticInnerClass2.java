package Static_InnerClass;

public class StaticInnerClass2 {

	
	    static String outerStatic = "Outer Static";

	    static class Inner {
	        // Instance variable
	        String innerInstance = "Inner Instance";

	        // Static variable
	        static String innerStatic = "Inner Static";

	        void display() {
	            System.out.println("Outer Static: " + outerStatic); // ✅
	            System.out.println("Inner Instance: " + innerInstance); // ✅
	            System.out.println("Inner Static: " + innerStatic); // ✅
	        }

	        static void staticMethod() {
	            System.out.println("Static Method in Inner");
	            System.out.println("Outer Static: " + outerStatic); // ✅
	            // System.out.println(innerInstance); // ❌ Not allowed in static method
	        }
	    }

	    public static void main(String[] args) {
	    	StaticInnerClass2.Inner innerObj = new StaticInnerClass2.Inner();
	        innerObj.display();
	        
	        StaticInnerClass2.Inner.staticMethod();
	    
	}

}
