package final_this_super;


// 3.class: if we use final keyword in class then we cannot extend that class to child class
final class Animal{
	public  void eat() {
		System.out.println("this is final class");
	}
}

/*
class dog extends Animal{ // we used final for class Animal so it cannot be extend
	public void run() {
		System.out.println("this is useing final child");
	}
}
*/

// 2.method:
class Person{
	public final void waiting() {
		System.out.println("shwetha is waiting");
	}
}

/*
class Shwetha extends Person{
	public void waiting() { // this overriding of class Person  and it show error bcs we used final for method in person class
		System.out.println("this is shwetha waiting");
	}
}
*/

public class FinalInJava {
	public static void main(String[] args) {
		
		// final
		/*
		 * final --> we cannot change the value
		 * 
		 * variables,method,class
		 * varibale --> the variable values cannot be change
		 * method --> we cannot override
		 * final class -->  we cannot extend that class
		 */
		
		// 1.variable:
		
		
		final double Pi = 3.14;
		System.out.println(Pi);
//		fi = 4.65; //shows a error bcs in  variable  value cannot change
//		System.out.println( fi);
//		
		//
	}

}
