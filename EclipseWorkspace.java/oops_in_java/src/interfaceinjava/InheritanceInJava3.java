package interfaceinjava;


// this is about the interface concept

interface Interface1{
	public void method();
	// class and interface are same but interface has no body as in method() and class has body
	// for below if dont use default then it show error to remove the body bcs abstract has no body
	// we use default then error will remove
	
	// if we dont wnat to declare a class in bodyBUT NEED TO DECLRAE BODY IN INTERFACE WE USE defult or static within interface
	public default void defaultMethod() {
		System.out.println("this is default method in java interface");
	}
	public static void staticMethod() {
		System.out.println("this is static method in java interface");
	}
}

class Child1 implements Interface1{

	@Override
	public void method() {
		System.out.println("this is method");
		
	}
	
}

public class InheritanceInJava3 {
	
	
	public static void main(String[] args) {
		// default and static method inside interface
		
		/*
		 *if we dont want to declare a class in bodyBUT NEED TO DECLRAE BODY IN INTERFACE WE USE 
		 defult or static within interface
		 */
		
		// we cannot call constructor inside the interface
		
		Child1 child = new Child1();
		child.method();
		Interface1.staticMethod(); // Static need to be call by interface_name when we calling a static method from the interface
		child.defaultMethod();
	}
}
