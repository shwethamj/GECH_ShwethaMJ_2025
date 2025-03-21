package inheritance;


interface Interface{
	public void interfaceMethod();
}

class ParentTwo{
	public void parentMethod() {
		System.out.println("this is parentTwo");
	}
}

class ChildHybrid extends ParentTwo implements Interface{
	public void childmethod() {
		System.out.println("this is child hybrid");
	}

	@Override
	public void interfaceMethod() {
		System.out.println("thiss is interface method");
	}
}
public class HybridInheritence {

	public static void main(String[] args) {
		 ChildHybrid child = new ChildHybrid();
		 child.childmethod();
		 child.parentMethod();
		 child.interfaceMethod();
	}

}
