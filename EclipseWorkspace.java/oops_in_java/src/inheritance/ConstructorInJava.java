package inheritance;

class Student1{  //default function
	//static
	public int age;
	public String name;
	public double marks;
	
	//full args constructor
	// for one constructor we can create multiple objects
	public Student1(int age, String name, double marks) {  //constructor
		System.out.println("Constructor");
		this.age = age;
		this.name = name;
		this.marks = marks;
	}
	
	//no args constructor
	// when no argumnet is given for object then it will print the default values that declares in the begining of class
	public Student1()
	{
		System.out.println("no args constructor");
	}
	
	//action
	public void isPlaying() {
		System.out.println("Student is playying");
	}
	public void isSleeping() {
		System.out.println("sudnet is slepping");
	}
	public void display() {
		System.out.println("NAme:"+this.name);
		System.out.println("age:"+this.age);
		System.out.println("marks:"+this.marks);
	}
}
public class ConstructorInJava {
	public static void main(String[] args) {
		// for full args constructor
		Student1 std1= new Student1(12,"shwetha",230f); 
		//in output syso of constructor will print(constructor)bcs we declare this(std1)
		//one so constructor call by itsself
        std1.display();
        
        Student1 std3 = new Student1(32,"shwe",300);
		std3.display();
		
        // for no args constructor
		Student1 std2 = new Student1();
		std2.display();
		
		
	}

}
