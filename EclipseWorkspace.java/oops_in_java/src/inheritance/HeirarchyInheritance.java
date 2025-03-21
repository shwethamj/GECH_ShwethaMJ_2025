package inheritance;


class OneParentclass{
	public void OneparentMethod(){
		System.out.println("this is parent");
	}
}

 class Child1 extends OneParentclass{
	 public void child1Method(){
			System.out.println("this is child1");
		}
 }
 
 class Childclass1 extends OneParentclass{
	 public void childclass1Method(){
			System.out.println("this is child4");
		}
 }
public class HeirarchyInheritance {i

	public static void main(String[] args) {
		
		Child1 child = new Child1();
		child.child1Method();
		child.OneparentMethod();
		System.out.println("------------------------------------------------");
		
		Childclass1 child1 = new Childclass1();
		child1.childclass1Method();
		child1.OneparentMethod();
		
	}
}
