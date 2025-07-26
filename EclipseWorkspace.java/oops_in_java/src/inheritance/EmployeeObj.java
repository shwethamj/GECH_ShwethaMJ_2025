package inheritance;

//ctrl + shift + o --> to clear the unwanted line
// Ctrl + shift +f --> to format the code

class Employee {
	String name;
	String dept;
	int salary;

	public void isworking() {
		System.out.println("employee is working ");
	}
}

public class EmployeeObj {

	public static void main(String[] args) {
		Employee emp = new Employee();
		emp.name = "shweetha";
		emp.dept = "cse";
		emp.salary = 25000;

		System.out.println("name : " + emp.name);
		System.out.println("department : " + emp.dept);
		System.out.println("salary : " + emp.salary);

		Employee emp1 = new Employee();
		emp1.name = "radha";
		emp1.dept = "ece";
		emp1.salary = 50000;

		System.out.println("----------------- \n name : " + emp1.name);
		System.out.println("department : " + emp1.dept);
		System.out.println("salary : " + emp1.salary);
		emp1.isworking();

	}
}
