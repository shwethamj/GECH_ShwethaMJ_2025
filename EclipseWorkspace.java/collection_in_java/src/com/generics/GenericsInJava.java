package com.generics;

import java.util.ArrayList;
import java.util.List;

public class GenericsInJava {

	public static void main(String[] args) {
		
		/*
		 GENERICS:
		 =========
		   * to provide the Type safety and to avoid the Type casting in collection
		    	then we should go for generic
		   * GENERIC: to add type safety we declare the obj type like <Integer>, <Double> etc and to avoid typecasting

		 Syntax:
		 =========
		 	List<type_of_object> arr = new List<type_of_object>();
		 	
		 	List<Integer> list = new ArrayList(Integer); ==> before java8
		 */

		
		char [] arr = {'a','b','c'} ;// type safety and without type casting	
		char firstEle = arr[0]; 
		System.out.println(firstEle);
		
		//without generics :
		List arr1 = new ArrayList();
		arr1.add(2);
		arr1.add(10.4);
		arr1.add("hii");
		
		//int value = arr.get(0); // object cannot convert to int here so we use explicit unboxing for below one
		int value = (int) arr1.get(0); //type casting 
		System.out.println(value);
		System.out.println("---------------------------");
		
		
		//using generics
		List<Integer> list = new ArrayList<>();
		list.add(12);
		list.add(56);
	//  list.add(30.3); // it (Double) cannot be added to list bcs out declared type is integer 
		
		 System.out.println(list);
		 int val = list.get(0); //no type casting 
		 System.out.println(val);
		 System.out.println(list.get(1));
		
	}

}
