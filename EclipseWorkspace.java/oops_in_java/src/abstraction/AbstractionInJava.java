package abstraction;

//1. using interface
interface one{
	public void method();
}
 
class Lion implements one{
	
	@Override
	public void method() {
		System.out.println("Lion is eating");
		System.out.println("---------------------------------------------");
	}
	
}

//2. using abstract -- for abbstract and interface we cannot create a objcet directly   
//   so we call another calss extends abstract class
abstract class Vehicle{
	
	//1.abstract method
	public abstract void method1();
	
	//2.without abstract method
	public void stop() {
		System.out.println("vwhicle is stopped");
	}
}

class Car extends Vehicle{
	public void start(){
		System.out.println("car start");
	}

	@Override
	public void method1() {
		System.out.println("vehicle is abstract");
		
	}
}
public class AbstractionInJava {

	public static void main(String[] args) {
		
		//ABSTRACTION
		/*
		 * it is  a process of hiding the implementation/body and showing only the essential resources.
		 
		 *WAYS:
		 
		 *1. interface - 100%
		 *2. abstract class (0-100%) -- when we want to achieve aabstracion in between 0 to 100% rande
		 *
		 */
	
		Lion lion = new Lion();
		lion.method();
		
		Car car =new Car();
		car.method1();
		car.start();
		car.stop();
	}

}
