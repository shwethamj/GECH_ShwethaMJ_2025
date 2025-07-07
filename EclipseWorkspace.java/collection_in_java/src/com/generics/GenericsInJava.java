package com.generics;

import java.util.ArrayList;
import java.util.List;

public class GenericsInJava {

	public static void main(String[] args) {
		//GENERICS
		/*
		 => to provide the type safety and to avoid the type casting in collection
		  then we should go for generic
		 */

		char [] arr = {'a','b','c'} ;// type safety
		char firstEle = arr[0]; // without typecasting
		System.out.println(firstEle);
		
		List arr1 = new ArrayList();
		arr1.add(2);
		arr1.add(10.4);
		arr1.add("hii");
		// object cannot convert to int here so we use explicit unboxing for below one
		//int value = arr.get(0);
		int value = (int) arr1.get(0); //typecasting was done
		System.out.println(value);
		System.out.println("----------------------------------------------------------");
		
		
		//GENERIC: to add type safety we declare the obj type like <Integer>, <Double> etc and to avoid typecasting
		// java 8 syntax:
		//List<Integer> list = new ArrayList(Integer); before java8
		List<Integer> list = new ArrayList();
		list.add(12);
		list.add(56);
		//list.add(30.3); // it (Double) cannot be added to list bcs out declared type is integer 
		 System.out.println(list);
		 int val = list.get(0); //no typecasting 
		 System.out.println(val);
		 System.out.println(list.get(1));
		
	}

}
