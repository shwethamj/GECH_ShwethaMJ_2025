package interfaceinjava;

interface Animal{
	public void makeSound(); // its an abstract mthod inside a interface which doesnot have body
}

//to extend a class with interface we use implement
// to do that hover the error on dog and create a unimolemented method--that overides implemented method and creates uimplemented method

class Dog implements Animal{

	@Override
	public void makeSound() {
		System.out.println("this is sound");
	}	
}

//for cat
class Cat implements Animal{
	@Override
	public void makeSound() {
		System.out.println("this is Catsound");	
	}
	
}
public class InterfaceInJava {
	
	//Interface
	/*
	 * It is a blue print of the class
	 * ==> the methods in the interface is by default abstract that doesnot have a body
	 * ==> form java8 we can write default and static methods in interface
	 * ==> if we dont know the complete implementation of a particular method then we use the interface as 
	 * 
	 * interface interface_name{
	 *  //code
	 *  }
	 *  
	 *  interface Animal{
	 *  public void makeSound();
	 *  }
	 */
	public static void main(String[] args) {
	Dog dog = new Dog();
	dog.makeSound();
	
	Cat cat = new Cat();
	cat.makeSound();
 }

}
