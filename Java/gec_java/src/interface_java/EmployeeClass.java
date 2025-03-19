package interface_java;

public class EmployeeClass implements EmployeeInterface {
	

	@Override // here it comes override bcs isEmployee method in employeeInterface is overwrite here
	public void isEmployee() {
		System.out.println("this is employee class");
		// TODO Auto-generated method stub
		
	}
	
}
