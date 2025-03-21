package inheritance;

class GrandParentClass{
	public void GrandParentMethod() {
	System.out.println("this is grand parent method");
	}
}

class ParentClass extends GrandParentClass{
	public void ParentMethod(){
	System.out.println("this is  parent method");
	}
}

class ChildClass extends ParentClass{
	public void ChildMethod(){
	System.out.println("this is  child method");
	}
}

public class multiLevelInheritance {

	public static void main(String[] args) {
		 // if we use multilevel we dont need to create object for each class
		// we can decalre obj for ChildClass andd acces other two parent class
		//or if create obj for ParentClass then we access parentclass and grandparentclass
		ChildClass child = new ChildClass();
		child.GrandParentMethod();
		child.ParentMethod();
		child.ChildMethod();
	}

}
