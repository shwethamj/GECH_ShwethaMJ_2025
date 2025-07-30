package typecastingInJava;

public class TypeCastingInJava {

	public static void main(String[] args) {
		
		// TYPE CASTING
		/*
		 * CONVERSION OF ONE DATATYPE TO ANOTHER
		  
		 * 1. implicit type casting: (lower to higher) type casting done like below
		 * byte -> short -> int -> long -> double
		 
		 *2.explicit type Casting (can be convert higher to lower)
		 *double -> float -> long -> int -> short -> byte
		 
		Object:
		=======
			These are types of type casting between parent and child classes in inheritance.
			
			1.up casting
				==> Converting a subclass object to a superclass reference.
				==>For polymorphism (run-time method overriding)
				==>To treat all child objects as the same parent type
				==> Allowed by default (automatic)
				==> example: 
						Animal a = new Dog(); // Upcasting dog(child class) and (parent class)Animal
				==> can access the only parent method
				
			2.down casting
				==> Converting a superclass reference back to a subclass type.
				==> Not automatic — you must do it manually, and it can throw exceptions.
				==> example:
						Animal a = new Dog();
				 		Dog d = (Dog) a; 
				 		d.bark();             // ✅ Now you can access Dog methods  

		 */
		
		// implicit
		int a=20;
		long b=a;
		
		System.out.println("int:"+a);
		System.out.println("long:"+b);
		
		//explicit:
		// we cannot convert int to long in explicit
		long c =30;
		int d = (int)c;
		
		System.out.println("int d:"+d);
		System.out.println("long :"+c);
		
		short a2 = (byte)30;
		System.out.println("short:"+a2);
	}

}
