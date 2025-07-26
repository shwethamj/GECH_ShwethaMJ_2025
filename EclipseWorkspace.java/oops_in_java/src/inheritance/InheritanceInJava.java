package inheritance;

//1. single level:

class parent{
	int pData = 100;
	// if we use -> private =>it shows error bcs private need to use only within main class
	// static => same but we give static in place of public and to access  it we acceess directly with class name instaad of object 
	// static access => class _name.method();
	// default => it will give output bcs it can access within package 
	// default => we dont use default word simply we dont declare anything in the <access_specifer> place
	 
	void parentMethod() {    //default
		System.out.println("this is parent method");
	}
}

class Child2 extends parent{
	int cData =200;
	// public => can access through anywhere
	public void child2Method() {  //public
		System.out.println("this is child method");
	}
}

public class InheritanceInJava{

	public static void main(String[] args) {
		
		Child2 child = new Child2();
		child.parentMethod();
		child.child2Method();
		System.out.println(child.pData);
		System.out.println(child.cData);
	}

}
