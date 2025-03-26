package oops;

class VehicleBase{
	public String brand;
	public double speed;
	
	
	
	public VehicleBase(String brand, double speed) {
		super();
		this.brand = brand;
		this.speed = speed;
	}
}

class Car extends VehicleBase{

	public int numDoors;

	
	public Car(String brand, double speed,int numDoors) {
		super(brand, speed);
		this.numDoors=numDoors;
	}

	public void Display1() {
		System.out.println(" The brand:" +brand+ " speed of vehicle:" +speed+ "  has number of doors:"+numDoors);
	}
}

public class Assignment2 {

	public static void main(String[] args) {
		Car car = new Car("hundai", 20.30,4);
		car.Display1();
		

	}

}
