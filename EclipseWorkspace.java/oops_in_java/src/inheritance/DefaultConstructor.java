package inheritance;

class Car{
	String name;
	String model;
	
	//no args constructor(default)
	public Car() {
		
	}
	//parameter constructor(full args )
	public Car(String name, String model) {
		this.name = name;
		this.model = model;
	}
	
	public void method() {
		System.out.println("The Car is : "+this.name +" and Model is : "+this.model);
	}
	
}
public class DefaultConstructor {

	public static void main(String[] args) {
		/*
		 * DEFAULT CONSTRUCTOR
		 * ====================
		 * 	default constructor will returns internally a obje when object is created and dont give any value
		 *  it returns default values
		 */
		//here i am using default constructor and it returns(default value) null(String) and 0(int)
		Car car=new Car();
		car.method();
		
		Car car1 =new Car("mahendra","Mahindra XUV700");
		car1.method();
		
		//for default constructor there is no return type but i create object using 
		//deault constructor then it internally returns obj(car2)
		Car car2 = new Car();

	}

}
