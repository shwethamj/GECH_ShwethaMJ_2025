package com.set;

import java.util.TreeSet;

public class TreeSetInJava {

	public static void main(String[] args) {
		/* 
		TREESET
				
		* same as set but
		* it preserves the order
		* TresSet is sorted set (defaulty descending sort)
		* unlike set which doesnott preserve the order.
		* Doesnt allow duplicates 
		* random access possible.
		
		*/
		
//		TreeSet<Integer> treeset = new TreeSet<Integer>(); //sorting in descending order -->using comparable
		
		TreeSet<Integer> treeset = new TreeSet<Integer>((a,b)->b-a); //ascending order ->using comparator
		treeset.add(2);
		treeset.add(10);
		treeset.add(100);
		treeset.add(12);
		treeset.add(13);
		System.out.println(treeset);
				
	}

}
