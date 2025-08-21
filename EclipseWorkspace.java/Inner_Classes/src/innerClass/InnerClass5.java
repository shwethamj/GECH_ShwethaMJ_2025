package innerClass;

import innerClass.Car.Enginee;

class Car{
	public String name = "car1";
	
	class Enginee{
		public String name = " enginename";
		public void display() {
			System.out.println("inner class using this : "+this.name);
			System.out.println("innerclass : "+Enginee.this.name);
			System.out.println("outer class access by this : "+Car.this.name);
		
		}
	}
}

public class InnerClass5 {
  
	public static void main(String[] args) {
		Car car = new Car();
		Enginee en = car.new Enginee();
		en.display();
		System.out.println("-----------------------------------");
		
		//or
		new Car().new Enginee().display();
	}
	
	
}
