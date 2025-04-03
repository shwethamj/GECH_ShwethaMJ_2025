package oops;


	class Shape{
		double area;
		public void calculateArea() {
			System.out.println("this is shape");
		}
	}
	
	class Circle extends Shape{
		public void calculateArea(int r) {
			
			area = 3.14*r*r;
			System.out.println("area of circle is:"+area);
		}
	}
	class Rectangle extends Shape{
		public void calculateArea(int length, int breadth) {
			area = length*breadth;
			System.out.println("rectangle area::"+area);
		}
	}
	public class Assignmnet5 {
		
	public static void main(String[] args) {
		
		Rectangle rect = new Rectangle();
		rect.calculateArea(30,23);
		
		Circle cir = new Circle();
		cir.calculateArea(23);
		
		
	}

}
