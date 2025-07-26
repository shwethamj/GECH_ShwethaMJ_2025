package introduction_to_java.first_program;

class Student{
	public int age;
	 String name;
	 
	 public void iswriting() {
		 System.out.println("student is writing");
	 }
}
public class ObjectClass {

	/*
	  class 
	  =====
	 * represent the state(property) and behavior(action) of object / blueprint of object
	 * 
	 * class will not take a memory
	 * 
	 * syntax -->
	 * 			class class_name{
	 * 				property; == variable
	 *  			action; == method/function
	 * 			}
	 * 
	 property--> variable
	 ========
	 * 	usn, name,age,branch
	 * 
	  action -->method
	  =======
	 * 		ispalying();
	 * 		isworking();
	 * public void method_name(){}
	 *  	 ===> here void --> return type --> if we use void no need to write return(like return 0;)
	 
	  object:
	  =======
	 * 	implemantation of class
	 * object will take a memory
	 * 
	 * syntax--> class_name obj_name = new classname();
	 * here class_name = is non primitive datatype of obje_name
	 
	 setvalue :
	 =========
	 *obj_name.var_name = value;
	 
	 print var:
	 ========
	 *syso(obje_name.var_name);
	 
	 method call:
	 ===========
	 *obje_name.method_name();
	 
	 */
	
	public static void main(String[] args) {
		//object create
		Student std =new Student();
		//value set
		std.name ="shwetha";
		std.age=21;
		//value print
		System.out.println("name : "+std.name);
		System.out.println("age : "+std.age);
		//method call
		std.iswriting();
	}
}
