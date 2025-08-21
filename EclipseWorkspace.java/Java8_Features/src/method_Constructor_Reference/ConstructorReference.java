package method_Constructor_Reference;

import java.util.function.Function;
import java.util.function.Supplier;

class Student{
	String name;
	
	public Student() {
	System.out.println("this is constructor refrence");
	}
	
	public Student(String s) {
		this.name =s;
		System.out.println("the name is : "+this.name);
		System.out.println("this is constructorRefrence with parameter");
		}
	
}

public class ConstructorReference {

	public static void main(String[] args) {
		
		//without constructor reference
		Supplier<Student> sup1 = ()->new Student();
		sup1.get();
		
		//with constructorReference --> classname ::new ;
		Supplier<Student> sup2 = Student::new;
		sup2.get();
		System.out.println("-------------------------------------------");
		
		//constructor with parameter
		Function<String, Student> fun1 = Student::new;
		fun1.apply("shwetha");
	}
}
