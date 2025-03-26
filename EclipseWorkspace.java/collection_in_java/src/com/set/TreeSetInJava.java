package com.set;

import java.util.TreeSet;

public class TreeSetInJava {

	public static void main(String[] args) {
		// TREESET
				
		// same as set but it preserves the order unlike set which doest preserve the order.
		// Doesnt allow duplicates and random access possible.
		
		TreeSet<Integer> treeset = new TreeSet<Integer>((a,b)-> b-a); //sorting Ascending to descending.
		treeset.add(2);
		treeset.add(10);
		treeset.add(100);
		treeset.add(12);
		treeset.add(13);
		System.out.println(treeset);
				
	}

}
