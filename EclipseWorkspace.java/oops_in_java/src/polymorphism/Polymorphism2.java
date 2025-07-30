package polymorphism;

import java.util.Scanner;

//method overriding
class Shape{
	public int radius;

	public Shape(int radius) {
		this.radius = radius;
	}
	
	public void area() {
		System.out.println("the area of circle is 3.14*r*r");
	}
}

class Circle extends Shape{
	
	public Circle(int radius) {
		super(radius);
	}

	@Override
	public void area() {
		System.out.println("the area of circle is : "+(3.14*radius*radius));
	}
	
}
public class Polymorphism2 {

	public static void main(String[] args) {
		
		//by using constructor
		Circle area =new Circle(5);
		area.area();
		
		//up casting
		Shape c =new Circle(6);
		c.area();
		
		//by user input
		System.out.println("-------------------------------\nenter radius of circle :");
		Scanner sc =new Scanner(System.in);
		area.radius= sc.nextInt();
		area.area();
		
	}
}
