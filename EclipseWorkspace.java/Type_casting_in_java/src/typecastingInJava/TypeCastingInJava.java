package typecastingInJava;

public class TypeCastingInJava {

	public static void main(String[] args) {
		
		// TYPE CASTING
		/*
		 * CONVERSION OF ONE DATATYPE TO ANOTHER
		  
		 * 1. implicit type casting: (lower to higher) type casting done like below
		 * byte -> short -> int -> long -> double
		 
		 *2.explicit type Casting (can be convert higher to lower)
		 *double -> float -> long -> int -> short -> byte
		 */
		
		// implicit
		int a=20;
		long b=a;
		
		System.out.println("int:"+a);
		System.out.println("long:"+b);
		
		//explicit:
		// we cannot convert int to long in explicit
		long c =30;
		int d = (int)c;
		
		System.out.println("int d:"+d);
		System.out.println("long :"+c);
		
		short a2 = (byte)30;
		System.out.println("short:"+a2);
	}

}
