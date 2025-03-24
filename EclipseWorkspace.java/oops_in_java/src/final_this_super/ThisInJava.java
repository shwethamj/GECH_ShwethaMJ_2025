package final_this_super;

class Person1{
	public String name;
	public int age;
	
	//no-args and default constructor created defaultly by JPA
	public Person1() {
		System.out.println("this is default constructor");
	}
	
	// args
	public Person1(String name, int age) {
		// 2. refer the constructor
		this(); // this display default constructor (this is default constructor)
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
		 * 1.used to refer instance variablw in current class
		 * 2. used to refer current class constructor
		 * 3.used refer method in current class
		 */
		Person1 person =new Person1();
		person.display();
	}

}
