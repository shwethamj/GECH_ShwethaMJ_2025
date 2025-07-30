package oopsAssignment;

//POLYMORPHISM
class Shape{
	public void area() {
		System.out.println("the area of different shape ");
	}
}

class Circle extends Shape{
	private int radius;
	
	public Circle(int radius) {
		super();
		this.radius = radius;
	}

	@Override
	public void area() {
		double circlearea = 3.14*radius*radius;
		System.out.println("The area of Circle is : "+circlearea);	
		System.out.println("--------------------------------------");
	}
}

class Rectangle extends Shape{
	private int length,breadth;

	public Rectangle(int length, int breadth) {
		super();
		this.length = length;
		this.breadth = breadth;
	}
	
	@Override
	public void area() {
		double rectarea = length *breadth;
		System.out.println("The Area of Rectangle is : "+rectarea);
		System.out.println("--------------------------------------");
	}
}

class Square extends Shape{
	private int side;

	public Square(int side) {
		super();
		this.side = side;
	}
	
	@Override
	public void area() {
		double squarearea= side*side;
		System.out.println("the Area of Square is : "+squarearea);
		System.out.println("--------------------------------------");
	}
}
public class ShapeAreaCalculation {
	public static void main(String[] args) {
		Square s=new Square(3);
		s.area();
		
		Rectangle r=new Rectangle(2,3);
		r.area();
		
		Circle c=new Circle(5);
		c.area();
			
		
	}

}
