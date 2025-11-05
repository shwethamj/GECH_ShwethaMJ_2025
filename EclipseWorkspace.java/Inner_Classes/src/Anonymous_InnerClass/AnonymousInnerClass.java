package Anonymous_InnerClass;

class Person{
	public String name;
	public int age;
	
	public void isWalking() {
		System.out.println("person walking");
	}
}
public class AnonymousInnerClass {
	public static void main(String[] args) {
		/* run time polymorphism
		 * below is AnonymousInnerClass
		 * below doing upcasting
		 */
		Person person = new Person() {
			public String name ="mohan";
			public int age =21;
			
			//override the method of parent
			public void isWalking() {
				System.out.println("mohan walking");
			}
		};
		
		person.isWalking(); //this call anonymous class
		System.out.println("name: "+person.name); //this call the parent
		System.out.println("name: "+person.age);
	}

}
