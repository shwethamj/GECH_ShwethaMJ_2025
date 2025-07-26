package inheritance;

//to classes we can give only 2 access specifier :public and default

class Student{  //default function
	//state
	public int age=20;
	public String name="shwetha";
	public double marks= 600 ;
	
	//if we not create a any constructor then JPA will create default constructor
	
	
	//action
	public void isPlaying() {
		System.out.println("Student is playying");
	}
	public void isSleeping() {
		System.out.println("sudnet is slepping");
	}
	
}
//we can declare multiple class within one
// here public not used for this class because public can be used only once and that is for main class only
public class ClassObjectInJava {

	public static void main(String[] args) {
		//class
		/* class will represent the state and behavior of an object
		 * state -->property
		 * behavior --> action
		 */
		
		/*
		 * Object:
		 * object is a implementaion of class(state and action)
		 * ex: Studnet2
		 
		 * Property :
		 * ex: Usn, name, branch
		 
		 
		 * action:
		 * ex: isPlaying(), isSleeping()
		 
		 *How to declare class and objects
		 *class class_name{
		 *state
		 *action
		 *}
		 
		 *ex:
		 *class Student{
		 *		property;
		 *		public int age =20;
		 
		 *		action
		 *		public void isPlaying(){
		 *		Syso("the student is palying");
		 *		}
		 *  }
		 *Student std1= new Student();
		 */
		//creating object for class Student
		
		// student1
		Student std1=new Student();
		System.out.println(std1.name);
		System.out.println(std1.age);
		System.out.println(std1.marks);
		std1.isPlaying();
		std1.isSleeping();
		System.out.println("---------------------------------------------");
		
		//student2
		Student std2=new Student();
		System.out.println(std2.name);
		System.out.println(std2.age);
		System.out.println(std2.marks);
		std2.isPlaying();
		std2.isSleeping();
	}
}
