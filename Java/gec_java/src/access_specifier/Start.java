package access_specifier;

public class Start {
	public static void main(String[]args) {
		System.out.println("hello world");
		//object
//		Child child1=new Child();
//		child1.show();
//		child1.Display();
		
		Child.show(); //  it is static so we use without creating object
		
		Employee emp=new Employee();
		System.out.println(emp.getEmpId());
		System.out.println(emp.getEmpName());
		System.out.println("=============================");
		emp.setEmpId(34);
		emp.setEmpName("roop");
		System.out.println("after using settters");
		System.out.println("--------------------");
		System.out.println(emp.getEmpId());
		System.out.println(emp.getEmpName());
	}

}
