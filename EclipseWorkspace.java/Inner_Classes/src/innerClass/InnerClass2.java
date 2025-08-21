package innerClass;

public class InnerClass2 {

	class Department{
		public int a =10;
	}
	
	public static void main(String[] args) {
		InnerClass2 outer = new InnerClass2();
		Department dept = outer.new Department(); //creating obj for inner class
		System.out.println(dept.a);
	}
}
