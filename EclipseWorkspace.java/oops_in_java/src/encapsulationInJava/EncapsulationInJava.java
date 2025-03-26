package encapsulationInJava;

class Student{
	private String name;
	private int age;
	private double marks;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}

	
}

public class EncapsulationInJava {

	public static void main(String[] args) {
		
		//Encapsulation
	/*
	 * encapsulation is a mechanism that binds data(variables) and method(getters  and setters) into a single unit i.e
	 
	 * EVERY FIELDS must be private when we want to protect(restrict direct access) data ,so we use encapsulation and create gutter and setters
	  to make  it public so that we can set and get the data ourself wehen we create objcet
	 
	 * =>Even if we dont create constructor ,JPA will create a no args constructor
		  automatically by default when we create a object/instance for that respective
		  class.
	 */
		
		Student stud = new Student();
		stud.setName("shwetah");
		System.out.println(stud.getName());

}
}
