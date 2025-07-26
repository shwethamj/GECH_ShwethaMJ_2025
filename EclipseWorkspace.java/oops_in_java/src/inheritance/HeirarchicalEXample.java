package inheritance;

class Grandparent{
	public void grandparent() {
		System.out.println("the grandparent class");
	}
}

class Parent1 extends Grandparent{
	public void parent1(){
		System.out.println("parent1 class inherit grandparent");
	}
}

class Parent2 extends Grandparent{
	public void parent2() {
		System.out.println("parent2 inherit grandparent");
	}
}

class Childclass extends Parent2{
	public void child1() {
		System.out.println("child1 class inherit parent1");
	}
}
class Childclass2 extends Parent2{
	public void child2() {
		System.out.println("child2 inherit parent1");
	}
}
public class HeirarchicalEXample {
	public static void main(String[] args) {
		
		Childclass2 c2= new Childclass2();
		c2.child2();
		c2.parent2();
		c2.grandparent();
		System.out.println("--------------------------------------\n");
		
		Childclass c1= new Childclass();
		c1.child1();
		c1.parent2();
		c1.grandparent();
		System.out.println("--------------------------------------\n");	
		
		Parent1 p1=new Parent1();
		p1.parent1();
		p1.grandparent();
	}

}
