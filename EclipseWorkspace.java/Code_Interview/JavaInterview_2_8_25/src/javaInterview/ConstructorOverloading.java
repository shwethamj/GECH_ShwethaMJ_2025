package javaInterview;

class Area{
	int length,breadth ,height;

	//default(no-args)
	public Area() {
		super();
		System.out.println("default constructor");
	}

	//1 parameter constructor
	public Area(int length) {
		super();
		this.length = length;
		int square  = length * length;
		System.out.println("the area of square : "+square);
	}

	//2 parameter constructor
	public Area(int length, int breadth) {
		super();
		this.length = length;
		this.breadth = breadth;
		int rectangle  = length * breadth ;
		System.out.println("the area of rectangle : "+rectangle);
	}

	//3 parameter constructor
	public Area(int length, int breadth, int height) {
		super();
		this.length = length;
		this.breadth = breadth;
		this.height = height;
		int cube  = length * breadth * height;
		System.out.println("the area of cube : "+cube);
	}
	
	
}
public class ConstructorOverloading {

	public static void main(String[] args) {
		
		//deafult constructor
		Area a =new Area();

		//1 parameter constructor
		Area b = new Area(2);

		//2 parameter constructor
		Area c = new Area(2,3);
		
		//3 parameter constructor
		Area d = new Area(2,3,5);

		
		
	}
	
}
