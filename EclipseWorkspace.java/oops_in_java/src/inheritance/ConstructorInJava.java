package inheritance;

Static {
	syso
}
class Student1 { // default function
	// static ==> public static String name;
	public int age;
	public String name;
	public double marks;


	// full args constructor
	// for one constructor we can create multiple objects
	public Student1(int age, String name, double marks) { 
		System.out.println("Constructor");
		this.age = age;
		this.name = name;
		this.marks = marks;
	}

	// no args constructor
	// when no argumnet is given for object then it will print the default values
	// that declares in the begining of class
	public Student1() {
		System.out.println("no args constructor");
	}

	// action
	public void isPlaying() {
		System.out.println("Student is playying");
	}

	public void isSleeping() {
		System.out.println("sudnet is slepping");
	}

	public void display() {
		System.out.println("NAme:" + this.name);
		System.out.println("age:" + this.age);
		System.out.println("marks:" + this.marks);
	}
}

public class ConstructorInJava {
	public static void main(String[] args) {
		/*
		 * CONSTRUCTORS:
		   ============
		 *  Constructor is a special type of method used to initialize
		  	a newly created obj or values to the instance variable.
		 * syntax :
		 		access_modifier class_name(parameter){
		  				//code
		  		}
		  		
		 *Constructor dont have the return type(void or int )
		 *But internally it returns object.(default constructor)
		 *Java compiler gives defualt constructor(no-args) automaticaly when object created
		 *If we create a constructor then it will not give default constructor`
		 *Constructor belong to object ==> we cannot give constructor has static(access specifier)
		 *Cannot use final keyword
		 *Only allow the access modifier --> public ,private,protected
		 *We cannot inherit the constructor(in inheritance)
		  
		  VARABLE ACCESS:
		  ==================	
		 * if we use static varible --> we access that by directly using class name
		 *  -->belongs to class --> public static int a;
		 * Emplyee.a=1; //without creating obje accessing the variable
		  
		 * instance variable --> belongs to obje
		 * need to create a object after that need to access variable
		 
		 */

		// for full args constructor
		Student1 std1 = new Student1(12, "shwetha", 230f);
		// in output syso of constructor will print(constructor)bcs we declare
		// this(std1) one  so constructor call by itsself
		std1.display();

		// args constructor
		Student1 std3 = new Student1(12, "shwe", 34);
		std3.display();

		// for no args constructor
		Student1 std2 = new Student1(); //here if we dont give any value(constructur has no return type)then it returns object bcs i created a object
		std2.display();

	}

}
