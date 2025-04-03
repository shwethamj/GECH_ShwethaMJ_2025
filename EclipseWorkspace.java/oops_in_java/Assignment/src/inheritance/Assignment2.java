package inheritance;

interface Interface21{
	public void interfaceMethod1();
}

interface Interface22{
	public void interfaceMethod2();
}

interface InterfaceMain extends Interface21,Interface22{
	public void interfaceparentMethod();
}

class Parent21{
	public void Parent21Method() {
		System.out.println("this is parent class 1");
	}
}

class Parent22 extends Parent21{
	public void Parent22Method() {
		System.out.println("this is parent class 2");
		System.out.println("--------------------------------------------");
	}
}

class Child21 extends Parent22 implements InterfaceMain{
	public void childMethod21() {
		System.out.println("this is child class");
		System.out.println("--------------------------------------------");
	}

	@Override
	public void interfaceMethod1() {
		System.out.println("this is interface 1");
		System.out.println("--------------------------------------------");
	}

	@Override
	public void interfaceMethod2() {
		System.out.println("this is interface 2");
		System.out.println("--------------------------------------------");
		
	}

	@Override
	public void interfaceparentMethod() {
		System.out.println("this is main interface");
		System.out.println("--------------------------------------------");
	}
}


public class Assignment2 {
	public static void main(String[] args) {
		
		Child21 child = new Child21();
		child.childMethod21();
		child.Parent21Method();
		child.Parent22Method();
		child.interfaceparentMethod();
		child.interfaceMethod1();
		child.interfaceMethod2();
	}

}
