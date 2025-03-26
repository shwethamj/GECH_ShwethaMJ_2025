package interfaceinjava;

//this is about the interface concept
// inheritance is used bcs of it is reusable code

interface A{
	public void method();
}

interface B{
	public void method();
}

class Child implements A,B{

	@Override
	public void method() {
		System.out.println("this is method B");		
	}

//	@Override
//	public void method() {
//		System.out.println("this is method A");		
//	}
	
}
public class InheritanceInJava2 {
	public static void main(String[] args) {
		
		Child child=new Child();
		child.method();
//		child.method();
	}

}
