package oops;

interface Animal{
	public void eat();
	public void makesound();
}

class Dog implements Animal{

	@Override
	public void eat() {
		System.out.println("the dog eat pedigree");
		
	}

	@Override
	public void makesound() {
		System.out.println("tha dog make sound bow bow");
		System.out.println("---------------------------------------");
	}

}

class Cat implements Animal{

	@Override
	public void eat() {
		System.out.println("the cat is eating");
	}

	@Override
	public void makesound() {
		System.out.println("the cat is amkingsound");
		
	}
	
}



public class Assignment4 {

	public static void main(String[] args) {
		
		Dog dog = new Dog();
		dog.eat();
		dog.makesound();

		Cat cat = new Cat();
		cat.eat();
		cat.makesound();

	}

}
