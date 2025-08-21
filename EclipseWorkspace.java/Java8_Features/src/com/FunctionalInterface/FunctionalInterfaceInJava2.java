package com.FunctionalInterface;

@FunctionalInterface
interface Interface2{
	public void display();
}
@FunctionalInterface
interface Interface3{
	public int String(String s);
}

interface Interface4{
	public int add(int a,int b);
}

public class FunctionalInterfaceInJava2 {

	public static void main(String[] args) {
		
		// for using lamba expression ==> we can use only on lambda expression for one functionalinterface
		// int a =10;
		Interface2 i= ()->System.out.println("hello");
		i.display();
		
		 Interface3 i3= s-> s.length();
		 int res = i3.String("hello");
		 System.out.println(" size result is:"+res);
		 
		 
		 Interface4 i4 = (a,b)-> {return a+b;};
				 int result=i4.add(3,5);
				 System.out.println("lambda expression for add: "+result);
		 }
	
	}
//string parameter and total length




