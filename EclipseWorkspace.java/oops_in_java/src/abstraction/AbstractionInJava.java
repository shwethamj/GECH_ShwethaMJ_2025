package abstraction;

//1. using interface -- blueprint of class
interface Tiger {
	public void method();// in interface, method is abstract method (by default public and abstract method)

	void interfacemethod();

	// using static and default(after java8) can do implementation
	static void staticmethod() { 
		System.out.println(" static method ");
	}

	default void defaultmethod() {
		System.out.println(" default method ");
	}
}

class Lion implements Tiger {
	@Override
	public void method() {
		System.out.println("Lion is eating");
		System.out.println("---------------------------------------------");
	}

	@Override
	public void interfacemethod() {
		System.out.println("");

	}
}

/*
 * 2. using abstract for abstract and interface we cannot create a object
 * directly so we call another class extends abstract class if we need to write
 * abstract method it's class need to be abstract class abstract class is a
 * class which contains atleast one abstract method
 */
abstract class Vehicle {

	// 1.abstract method or non concrete method
	public abstract void method1();

	// 2.non abstract method or concrete method
	public void stop() {
		System.out.println("vwhicle is stopped");
	}
}

class Car extends Vehicle {
	public void start() {
		System.out.println("car start");
	}

	@Override
	public void method1() {
		System.out.println("vehicle is abstract");

	}
}

public class AbstractionInJava {

	public static void main(String[] args) {

		/*
		 * ABSTRACTION :
		 * ============ 
		 * it is a process of hiding the implementation/body
		 * and showing only the essential resources.
		 * ==>encapsulation hides data
		 * ==>abstraction hides implementation
		 
		 * WAYS:
		   ===== 
		 1. interface - 100% abstraction 
		 *  can implement the body in interface by using default and static (access modifier) --> after java8
		 *  after java9 onwards private is used in interface
		 
		 2. abstract class (0-100%) -- when we want to achieve abstraction in between 0 to 100% range abstract class
		 * is a class which contains atleast one abstract method
		 * 
		 */

		// interface
		Lion lion = new Lion();
		lion.method();

		lion.defaultmethod();// within interface
		Tiger.staticmethod();

		// abstract
		Car car = new Car();
		car.method1();
		car.start();
		car.stop();
		System.out.println("-----------------------------------");

		//without extending abstract class to other class
		/*
		Vehicle v = new Vehicle() { // anonymous inner class for abstraction
			@Override
			public void method1() {
				System.out.println("creating a object for abstract class without extending it to other class(child)");
			}
		};
		v.method1();
	*/
		
	}

}
