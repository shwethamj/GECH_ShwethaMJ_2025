package Anonymous_InnerClass;

/*
 * Anonymous classes cannot have static members (except static final constants).
 
      public static int i;  // ❌ Not allowed
*Static initializer block is not allowed in anonymous classes:
			Copy code
			static {
			    i = 10;
			}
 */

class Person1{
	public String name;
	public int age;
	
	public void isWalking() {
		System.out.println("person walking");
	}
}
public class AnonymousInnerClass1{
	public static void main(String[] args) {
		
		Person1 person = new Person1() {
			public static int i;
			//instance block --> giving parent variable a value
			//instance block --> to initialize the instance variable
			{ 
			name ="mohan";
			 age =21;
			}
			
			//static -->to initialize the value to static varibel
			static {
				i=10;
			}
			
			//override the method of parent
			public void isWalking() {
				System.out.println("mohan walking");
			}
		};
		
		person.isWalking(); //this call anonymous class
		System.out.println("name: "+person.name); //this call the anonymous
		System.out.println("name: "+person.age);
		
		//cannot access static and cannot write  static in anonymous class
	}

}

