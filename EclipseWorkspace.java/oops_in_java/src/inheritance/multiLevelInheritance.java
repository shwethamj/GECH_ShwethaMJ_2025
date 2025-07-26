package inheritance;

//Multilevel
class GrandParentClass{
	public void GrandParentMethod() {
	System.out.println("this is grand parent method");
	}
}

class ParentClass extends GrandParentClass{
	public void ParentMethod(){
	System.out.println("this is  parent method");
	}
}

class ChildClass extends ParentClass{
	public void ChildMethod(){
	System.out.println("this is  child method");
	}
}

public class multiLevelInheritance {

	/*STATIC used in main
		* The JVM (Java Virtual Machine) needs to start your program.
		*But it does not create any object of your class.
 		*So it needs a method it can call directly, without creating an object.
	
	STRING[]ARGS
		* String[] → An array of strings
		* args → The name of the array (you can name it anything, like myArgs, but args is common)
		* It helps you pass data into your program when it starts.
		* You can use it to:			
				Pass file names
				Set configuration values				
				Input user data before the program runs

	*/
	public static void main(String[] args) { 
		/* 
		 * 	if we use multilevel we dont need to create object for each class
		 	we can decalre obj for ChildClass andd acces other two parent class
			or if create obj for ParentClass then we access parentclass and grandparentclass	
		 */
		
		ChildClass child = new ChildClass();//i created object for childclass and accesing parent class method
		child.GrandParentMethod();
		child.ParentMethod();
		child.ChildMethod();
	}

}
