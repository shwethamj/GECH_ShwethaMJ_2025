package com.predicatefunction;

import java.util.Date;
import java.util.function.Supplier;

public class SupplierInJava {

	public static void main(String[] args) {
		//SUPLIER
		/*
		 * it won't take anything but it will return value
		 * datatype of lambda expression is defaultly FunctionalInterface
		 */
		
		Supplier<Date> s =()-> new Date(); // current date and time
		Date date =s.get();
		System.out.println(date);
		
	}

}
