package ArrayInJava;

class Student{
	String name;
	int roll;
}
public class ObjectInArray {

	public static void main(String[] args) {
		
		// Array of object
		
		Student[] student =new Student[2]; //array created for student
		
		student[0]=new Student(); //object for index0
		student[0].name= "shwetha";
		student[0].roll= 21;
		
		student[1]=new Student(); //object for index0
		student[1].name= "shwe";
		student[1].roll= 43;
		
		for(int i=0;i<2;i++) {
			System.out.println("student name : "+student[i].name+ " and roll : "+student[i].roll);
		}
	}
}
