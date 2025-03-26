package oops;

abstract class Employee{
	public String name;
	
	public abstract void calculateSalary(double Salary);
	
}

 class FullTimeEmployee extends Employee{

	@Override
	public void calculateSalary(double Salary) {
		// TODO Auto-generated method stub
		
	}
}

 class PartTimeEmployee extends FullTimeEmployee{
	@Override
	public void calculateSalary(double Salary) {
		System.out.println("the salary is : "+Salary);
		
	}
}


public class Asssignment3 {

	public static void main(String[] args) {
		 PartTimeEmployee obj = new PartTimeEmployee();
		 obj.calculateSalary(10000);
		

	}

}
