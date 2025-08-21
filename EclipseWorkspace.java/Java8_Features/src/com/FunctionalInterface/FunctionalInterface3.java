package com.FunctionalInterface;

@FunctionalInterface
interface Stringlen{
	 public int strlength(String s);
}

@FunctionalInterface
interface Upper{
	public String string(String a);
}

public class FunctionalInterface3 {

	public static void main(String[] args) {
		
		// String length
		Stringlen length =(s)->s.length();
		int res = length.strlength("hello");
		System.out.println("size : "+res);
	
		//string input convert to upper case
		Upper upper = (a)->a.toUpperCase();
		String res1 = upper.string("shwetha");
		System.out.println("uppercase : "+res1);
	}
}


