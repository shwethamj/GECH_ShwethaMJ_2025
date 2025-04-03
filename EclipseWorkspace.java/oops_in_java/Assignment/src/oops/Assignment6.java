package oops;

class Student{
	private String Name;
	private int RollNumber;
	private double marks;
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getRollNumber() {
		return RollNumber;
	}
	public void setRollNumber(int rollNumber) {
		RollNumber = rollNumber;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	
	
	@Override
	public String toString() {
		return "Student [Name=" + Name + ", RollNumber=" + RollNumber + ", marks=" + marks + "]";
	}
	public void passed() {
		if(this.marks>=40) {
			System.out.println("student =="+Name+"  rollNumber=="+RollNumber+"  marks=="+marks);
			System.out.println("student "+Name+"  is pass");
		}
		else {
			System.out.println("student =="+Name+"  rollNumber=="+RollNumber+"  marks=="+marks);
			System.out.println("student "+Name+"  is fail");
		}
	}
}

public class Assignment6 {

	public static void main(String[] args) {
		
		Student std = new Student();
		std.setName("shwetha");
		std.setRollNumber(43);
		std.setMarks(45);
		
		std.passed();
		System.out.println(std);
	}

}
