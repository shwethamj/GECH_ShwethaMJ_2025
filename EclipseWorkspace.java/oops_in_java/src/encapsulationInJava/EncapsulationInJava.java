package encapsulationInJava;

class Student{
	private String name;
	private int age;
	private double marks;
	
	public String getName() {   // datatype use as return type
		return name;		    //or return this.name
	}
	public void setName(String name) { //void bcs dont need to return 
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
		
	/*ENCAPUSALTION
	  =================	
	 * Encapsulation is a mechanism that binds data(variables) and method(getters  and setters) into a single unit i.e
	   ==> Encapsulation hides data
	 *property as private and method as public using getter setter
	 
	 * EVERY FIELDS must be private when we want to protect(restrict direct access) data ,so we use encapsulation
	 * create gutter and setters to make  it public so that we can set and get the data ourself when we create object
	 
	 * =>Even if we don't create constructor ==> JPA will create a no args constructor
		  automatically by default when we create a object/instance for that respective class.
	 */
		Student stud = new Student();
		stud.setName("shwetha");
		stud.setAge(21);
		stud.setMarks(95);
		System.out.println("Encapsulation \n------------------------------");
		System.out.println("Name : " + stud.getName());
		System.out.println("Age : " +stud.getAge());
		System.out.println("Marks : " +stud.getMarks());

  }
}
