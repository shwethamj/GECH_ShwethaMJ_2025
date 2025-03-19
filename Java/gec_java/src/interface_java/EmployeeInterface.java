package interface_java;

public interface EmployeeInterface {
	//interface is blueprint of class
	/*
	 * rules:
	 * =========
	 * 1.every method in interface is by default abstract and static
	 * 2.every state in interface is by default static and final(similar to constant it can not be changed)
	 */
	
	// to conncet a class to interface we use keyword called implements
	// for class to class - extends
	// for interface to interface - extends
	// static-can use without creating object
	// abstract- dooes not have a body
	// syntax- public abstract void display();- if we dont use keyword abstract (like public void display();) it will consider it as abstract by defalut
	public void isEmployee() ;

	}

}
