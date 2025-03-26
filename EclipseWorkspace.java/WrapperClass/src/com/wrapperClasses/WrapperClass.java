package com.wrapperClasses;

public class WrapperClass {

	public static void main(String[] args) {
		// JAVA IS A PURE OOP OR NOT ?
		// ==> NOT (BCZ IT INCLUDES/SUPPORT PRIMITIVE DATATYPE)
		//puer oop means need to treat everything as a object
		
		/*
		 * primitive data type"
		 * byte,short,int,long,float ,double,char,boolean
		 
		 *10,20,30,40 =>int (primitive datatypes)
		 
		 *String str = new String();
		 
		 *COLLECTION:
		 * ==> TO STORE A GROUP OF INDIVIDUAL N OBJECTS AS A SINGLE ENTITY
		 
		 * for string/object we can create/PERFORM collection but not for primitive datatype so we use WRAPPING CLASS for
		    primitive Datatypes to create a collection for them
		 * WRAPPING CLASS - used for primitive datatypes to perform collection on them
		 
		 *WRAPPING CLASS:
		 *=====================
		 *typecasting from primitive datatype to wrapper class
		 * byte --> Byte(max = 127 , min = -128)
		 * short -->Short
		 * int --> Integer
		 * long --> Long
		 * float -->Float
		 * double --> Double
		 * char --> Character
		 * boolean --> Boolean
		 */
		
		// 1. Auto boxing -->from primitive to wrapper
		//implicit
		int c =12;
		Integer I =c; //converted from int to Integer(wrapperclass) 
		System.out.println("int:"+c);
		System.out.println("integer:"+I);
		System.out.println("integer type:"+I.getClass().getName()); //for to print type of variable
		
		// explicit
		Integer i = Integer.valueOf(c);
		System.out.println("explicit Integer:"+i);

		
		// 2.unBoxing -->from wrapper to primitive
		Integer i1 =20;
		int a1 =i1.intValue(); // explicit
		// int a2 = i1; // implicit
		System.out.println("Integer:"+i1);
		System.out.println("Int:"+a1);
		System.out.println("int type:"+i1.getClass().getName());
		System.out.println("-------------------------------------------------------------------");
		
		
		
		//byte 
		//auto-boxing
		byte b1=4;
		Byte b2 =b1; //implicit
		System.out.println("byte class:"+b2);
		System.out.println("Byte type:"+b2.getClass().getName());
		 
		//unboxing
		Byte b3 =5;
		byte  b4 =b3.byteValue();
		System.out.println("byte:"+b4);
		System.out.println("int type:"+b3+ " is "+b3.getClass().getName());
		System.out.println("-------------------------------------------------------------------");
		
		//char 
		//auto-boxing
		char c1= 'g';
		Character c2 =c1; //implicit
		System.out.println("Character class:"+c2);
		System.out.println("Character type:"+c2.getClass().getName());
		 
		//unboxing
		Character c3 ='g';
		char  c4 =c3.charValue();
		System.out.println("byte:"+c4);
		System.out.println("int type:"+c3+ " is "+c3.getClass().getName());
		System.out.println("-------------------------------------------------------------------");
		
	}

}
