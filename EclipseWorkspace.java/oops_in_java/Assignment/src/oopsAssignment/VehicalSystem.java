package oopsAssignment;

//ABSTRACTION

abstract class Vehical{
	public abstract void start();
}

class Car extends Vehical{

	@Override
	public void start() {
		System.out.println("Car starts using key ignition");
		
	}
	
}

class Bike extends Vehical{

	@Override
	public void start() {
		System.out.println("Bike Starts using Kick");
		
	}
	
}
public class VehicalSystem {

	public static void main(String[] args) {
		
		Car c= new Car();
		c.start();
		
		Bike b = new Bike();
		b.start();
	}

}
