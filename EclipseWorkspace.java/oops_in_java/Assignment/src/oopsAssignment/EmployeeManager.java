package oopsAssignment;

//INHERITANCE
class Employee{
	public String name;
	double salary;
	String department;
	
	public Employee(String name, double salary, String department) {
		super();
		this.name = name;
		this.salary = salary;
		this.department = department;
	}
	
	public void displaydetails() {
		System.out.println("Employee  : "+name+" in the department : "+department+" has a salary of : "+salary);
		
	}
	
}

class Manager extends Employee{
	
	int teamsize;

	public Manager(String name, double salary, String department,int teamsize) {
		super(name, salary, department);
		this.teamsize =teamsize;
	}
	
	public void displayteamSize() {
		super.displaydetails();
		System.out.println("team size of "+name+ " is "+teamsize);
		System.out.println("---------------------------------------------------------");
	}
	
}
public class EmployeeManager {

	public static void main(String[] args) {
		Manager emp = new Manager("shwetha",25000,"IT",10);
		emp.displayteamSize();
		
		emp.displaydetails();
	}
}
