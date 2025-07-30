package polymorphism;


/*
 1.method-override
	 * static cannot be used in method-overriding
	 * if we dont want to print the class person content and need display other content so we use override by calling a
	  same method name in the child(Shwetha class) and write the content want we want to display instead of parent class content
	 * so when we call method_name in obj to print, the syso of class Person will not print, it prints child syso
*/
class Person{
	public  void waiting() {
		System.out.println("shwetha is waiting");
	}
}

class Shwetha extends Person{
	public void waiting() { // this overriding of class Person 
		System.out.println("this is shwetha waiting");
	}
}

//2.method-overloading -- same method with different input parameter within same class
// static and final can be used 

class Adiition{
	public static  void add(int a, int b) {
		System.out.println("Addition is:"+(a+b));
	}
	public static  void add(int a, int b,int c) {
		System.out.println("Addition is:"+(a+b+c));
	}
}

public class PolymorphismInJava {

	public static void main(String[] args) {
		
		/*POLYMORPHISM
          =============
		
		 * poly ==> many
		 * morphism ==> forms
		 * 	 
		 * it is a mechanism where methods will perform a different action based one the situation
		
		 *1. Method-overloading(one class)/compile time
		 *2. method-override(two class) /runtime
		 *
		 * 1. ==> overloading/Compile time polymorphism /static polymorphism/static binding
		 *   - same method with different inputs within the same class.
		 *   - Called as Compile time polymorhism bcs the compiler decides which input method to be called during compile time.
		 * 
		 * 2. ==> overriding for two classes - Using the same method
		 * 	- in the child class extending to parent class but printing different by
		 *	- overriding the method and printing the new thing we want to print.
		 */
		
		//1.method-overriding 
		Shwetha shwetha = new Shwetha();
		shwetha.waiting();
		
		//2.method-overloading 
		
		//for default
		//Adiition addition = new Adiition();
		//addition.add(3, 50); // compille time  - here compiller check whether it need to call 2 input method or 3 input 
		//addition.add(5,6,7);
		
		//for static 
		// if we use static overloading is possible but but overriddding is not possible
		Adiition.add(2,4);
		Adiition.add(2,4,5);
	
		
	}

}
