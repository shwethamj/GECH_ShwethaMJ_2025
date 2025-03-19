package operators_in_java;

public class AssignmentOperator {
	
	public static void main(String[]args) {
		
		//1.Arithmetic  -
		int a= 5;
		int b=3;
		System.out.println("Arithmetic Operator");
		System.out.println("+:"+(a+b));
		System.out.println("-:"+(a-b));
		System.out.println("*:"+(a*b));
		System.out.println("/:"+(a/b));
		System.out.println("%:"+(a%b));
		System.out.println("----------------------------------------");
		
		//2.Assignment operators
		int x=1;
		System.out.println("Assignment Operator");
		System.out.println("+:"+(x+=3));
		System.out.println("-:"+(x-=3));
		System.out.println("*:"+(x*=3));
		System.out.println("/:"+(x/=3));
		System.out.println("%:"+(x%=3));
		System.out.println("----------------------------------------");
		
		//3.Relational operator
		int y=30;
		int z=40;
		System.out.println("Relational Operator");
		System.out.println("equal:"+(y==z));
		System.out.println("greater:"+(y>z));
		System.out.println("lesser:"+(y<z));
		System.out.println("equalor greater than:"+(y>=z));
		System.out.println("equalor less than:"+(y<=z));
		System.out.println("----------------------------------------");
		
		//4.Logical operator
		boolean c=true;
		boolean d=false;
		System.out.println("Logical Operator");
		System.out.println("&&:"+(c&&d));
		System.out.println("||:"+(c||d));
		System.out.println("!=:"+(c!=d));
		System.out.println("----------------------------------------");
		
		//5.Bitwise operators
		int e=5;
		int f=10;
		System.out.println("bitwise operator");
		
		

	}

}
