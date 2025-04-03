package inheritance;


interface Interface1{
	public void interface1Method();
}

interface Interface2{
	public void interface2Method();
}

class Parent1{
	public void parent1Method() {
		System.out.println("this is parent 1");
	}
}

class Child1 extends Parent1 implements Interface1,Interface2{

	public void child1Method(){
		System.out.println("this is child 1");
	}
	@Override
	public void interface2Method() {
		System.out.println("this is interface 1");
	}

	@Override
	public void interface1Method() {
		System.out.println("this is interface 2");
	}
	
	
}

public class Assignment1 {

	public static void main(String[] args) {
		
		Child1 child = new Child1();
		child.child1Method();
		child.parent1Method();
		child.interface2Method();
		child.interface1Method();
	}

}
