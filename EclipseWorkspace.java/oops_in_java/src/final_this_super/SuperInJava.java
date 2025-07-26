package final_this_super;

//instance = object
class OldDog{
	public String name;
	public int age;
	
	public OldDog(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public void display() {
		System.out.println("name:"+this.name);
		System.out.println("age:"+this.age);
	}
}

class NewDog extends OldDog{

	public String eat;

	public NewDog(String name, int age, String eat) {
		super(name, age);
		this.eat = eat;
	}
	 
	public void display() {
		super.display();
		System.out.println("dog eat:"+this.eat);
		System.out.println("dog name is:"+this.name);
	}
	
	
}
public class SuperInJava {
	public static void main(String[] args) {
		
		// SUPER
		/*
		 * 1. it used to call the parent class super class instance variabele(to call parent class variable)
		 * 2. it used to call  the parent class super class constructor(to call parent class constrctor)
		 * 3. it used to call the parent class super class methods(to call the parent class method)
		 */
		
		NewDog newdog = new NewDog("bruno", 4, "vegitables");
		newdog.display();
	}
}
