package concretePojo;

class Students{
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Students(String name) {
		super();
		this.name = name;
	}
}

public class PojoClass {

public static void main(String[] args) {
		
		// POJO CLASS:
		
		/*
		 * plain old java object(pojo)
		 * 
		 * RULES:
		 * 1.the class should not extend or implements to any class or inheritance
		 * 2.every fields(states/properties) shoul be private
		 * 3.all-args constructor
		 * 4.no-args constructor
		 * 5.toString()
		 * 6.Getters and setter are public method
		 */
		
		Students std =new Students("shwetha");
		std.getName();
	}
}
