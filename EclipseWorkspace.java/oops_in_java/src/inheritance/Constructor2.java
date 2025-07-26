package inheritance;

class Employee1{
	String name;
	int salary;
	String Department;

	public Employee1(String name, String dept, int salary) {
		this.name = name;
		this.Department = dept;
		this.salary = salary;
	}

	public void method() {
		System.out.println(this.name+ "  working as employee ");
	}
}
public class Constructor2 {
	public static void main(String[] args) {
		Employee1 emp = new Employee1("shwetha", "cse", 250000);
		System.out.println("name : " + emp.name);
		System.out.println("department : " + emp.Department);
		System.out.println("salary : " + emp.salary);
		emp.method();
	}

}
