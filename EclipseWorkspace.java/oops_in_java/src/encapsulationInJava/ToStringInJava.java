package encapsulationInJava;


class Person{
	public String Name;
	public int age;
	public Person(String name, int age) {
		super();
		Name = name;
		this.age = age;
	}

@Override // right click -- source -- toString
	public String toString() {
		return "Person [Name=" + Name + ", age=" + age + "]";
	}
}


public class ToStringInJava{
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//when we calling obj by default it call "toString" method
		// so we override that tostring
		//tostring - method used to directly print the object
		
		Person person = new Person("shwetha", 4);
		System.out.println(person); // to directly print obj we use toString
		
	}

}
