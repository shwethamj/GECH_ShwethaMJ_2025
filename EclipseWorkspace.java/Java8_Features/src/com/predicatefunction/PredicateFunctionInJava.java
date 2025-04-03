package com.predicatefunction;

import java.util.function.Predicate;

public class PredicateFunctionInJava {

	public static void main(String[] args) {
		// PREDICATE
		
		/*
		 * it will holds the condition 
		 * and is a functional interface
		 */
	
		// need to find the number is even or not
		Predicate<Integer> p = (a)-> a%2==0;
		System.out.println(p.test(34)); // test is a method in predicate 
	}

}
