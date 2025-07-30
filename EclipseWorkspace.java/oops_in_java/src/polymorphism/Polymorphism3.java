package polymorphism;


class Shape1{
	public void area() {
		System.out.println("area of shape :");
	}
}
class Rectangle extends Shape1{
	private double length,breadth;

	public Rectangle(double length, double breadth) {
		super();
		this.length = length;
		this.breadth = breadth;
	}
	
	@Override
	public void area() {
	double area1= this.length *breadth;
	System.out.println("the AREA of rectangle is  : "+area1);
	}
	
}
public class Polymorphism3 {

	public static void main(String[] args) {
		
		//upcasting -- c
		Shape1 s = new Rectangle(3,2);
		s.area();
	}
}
