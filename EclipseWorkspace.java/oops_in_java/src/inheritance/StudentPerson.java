package inheritance;

//SUPER KEYWORD:
//imidiate call from parent class constructor,variable ,method 

class Person{
	String name;
	int age;
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public void method() {
		System.out.println("Person name : "+name);
	}
	
}
class Student12 extends Person{
	 int rollno;
	
	public Student12(String name, int age,int roll) {
		super(name, age); //variable access from parent class
		this.rollno=roll;	
	}
	
	@Override
	public void method() {
		System.out.println("using super keyword calling variable from parent class ");
		System.out.println("student details :\nname: " + name +", age :"+ age +" , rollno : " + rollno);
		System.out.println("-----------------------------------------------");
	}
	
	public void method1() {
		super.method(); //method access from parent class
		System.out.println("calling parent class method uding super keyword");
	}
	
}
public class StudentPerson {
	public static void main(String[] args) {
		
		Student12 s =new Student12("shwetha",21,43);
		s.method();
		s.method1();
	}
	
}
