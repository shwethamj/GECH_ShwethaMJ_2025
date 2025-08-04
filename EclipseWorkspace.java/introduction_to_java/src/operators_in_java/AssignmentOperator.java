package operators_in_java;

public class AssignmentOperator {

	public static void main(String[] args) {

		// 1.Arithmetic -
		int e = 5;
		int f = 3;
		System.out.println("Arithmetic Operator");
		System.out.println(e + " + " + f + " = " + (e + f));
		System.out.println(e + " - " + f + " = " + (e - f));
		System.out.println(e + " * " + f + " = " + (e * f));
		System.out.println(e + " / " + f + " = " + (e / f));
		System.out.println(e + " %" + f + " = " + (e % f));
		System.out.println("----------------------------------------");

		// 2.Assignment operators
		int x = 1;
		System.out.println("Assignment Operator");
		System.out.println(x+" + :" + (x += 3)); //x= x+3 =1+3 =4
		System.out.println(x+" - :" + (x -= 3)); //x=x-3 = 4-3 =1
		System.out.println(x+" * :" + (x *= 3)); // x= x*3 = 1*3 =3
		System.out.println(x+" / :" + (x /= 3)); //x =x/3 =3/3 =1
		System.out.println(x+" % :" + (x %= 1));// x = x%1 =1%1 =0  // x= 1%3=1
		System.out.println("----------------------------------------");

		// 3.Relational operator
		int y = 30;
		int z = 40;
		System.out.println("Relational Operator");
		System.out.println("equal:" + (y == z));
		System.out.println("greater:" + (y > z));
		System.out.println("lesser:" + (y < z));
		System.out.println("!=:" + (y != z));
		System.out.println("equalor greater than:" + (y >= z));
		System.out.println("equalor less than:" + (y <= z));
		System.out.println("----------------------------------------");

		// 4.Logical operator
		boolean c = true;
		boolean d = false;
		System.out.println("Logical Operator");
		System.out.println("&&:" + (c && d));
		System.out.println("||:" + (c || d));
		System.out.println("! : " + ( !d)); // ans= true
		System.out.println("! : " + ( !c)); // o/p == false
		System.out.println("----------------------------------------");

		// 5.Bitwise operators
		int a = 5; // Binary: 0101
		int b = 3; // Binary: 0011

		System.out.println("a & b = " + (a & b)); // AND -> 0001 = 1
		System.out.println("a | b = " + (a | b)); // OR -> 0111 = 7
		System.out.println("a ^ b = " + (a ^ b)); // XOR -> 0110 = 6
		System.out.println("~a = " + (~b)); // NOT -> 1010 (in 2's compliment = -6)
		System.out.println("a << 1 = " + (a << 1)); // Left shift -> 1010 = 10
		System.out.println("a >> 1 = " + (a >> 2)); // Right shift -> 0010 = 2

		// 6.shift operator
		int var1 = 3; // 0011
		int var2 = 4; // 0100
		System.out.println("shift << : " + (var1 << 1));// left shift ==> 0110 ans var<<1 ==> shift 1 position left
		
		System.out.println("shift << : " + (var2 >> 1));// right shft ==> 0010  var>>2 ==> shift 2 position right

		// 7.ternary
		int var3 = 4;
		int var4 = 5;
		System.out.println("tenary operator(?:) : " + (var3 < var4 ? var3 : var4));

		// 8. unary
		int var5 = 10;
		int var6 = 6;
		System.out.println("unary => increment  : " + (var5++));
		System.out.println("unary => decrement : " + (var5--));
	}

}
