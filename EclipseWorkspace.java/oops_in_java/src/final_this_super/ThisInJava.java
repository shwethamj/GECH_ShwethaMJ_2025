package final_this_super;

class Person1{
	public String name;
	public int age;
	
	//no-args and default constructor created default by JVM
	
	public Person1() {
		System.out.println("this is default constructor");
	}
	
	// args
	public Person1(String name, int age) {
		this();
		// 2. refer the constructor
//		this(); // this display default constructor (this is default constructor)
		System.out.println("this is argument constructor");
		// 1.refer the instant variable in curent class
		this.name = name; // USED TO REFER instant variable in current class
		this.age = age;
	}
	
	
	public void hello(){
		System.out.println("hello");
	}
	
	public void display() {
		//3. refer method in same class
		this.hello(); //it display hello method syso("hello)
		System.out.println("name is:"+this.name);
		System.out.println("age is:"+age);
	}
	
}

public class ThisInJava {
	
	public static void main(String[] args) {
		
		// THIS
		/*
		 * 1.used to refer instance variable in current class
		 * 2. used to refer current class constructor 
		 * 3.used refer method in current class and static method
		 * we can access the static variables using this keyword
		 */
		Person1 person =new Person1();
		person.display();
	}

}
