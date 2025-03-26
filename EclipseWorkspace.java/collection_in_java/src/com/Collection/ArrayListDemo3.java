package com.Collection;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ArrayListDemo3 {

	public static void main(String[] args) {
		
		List<Integer> list = new ArrayList<>();
		list.add(20);
		list.add(40);
		list.add(31);
		list.add(100);
		
		System.out.println("before sorting: "+list);
		
		//COLLECTIONS
		/*
		 * its a utility classes that provide methods to work with collection
		 */
		
		// 1.SORT
		Collections.sort(list);
		System.out.println("after sort: " +list);
	
		//2. min and max in list
		System.out.println("min value: "+Collections.min(list));
		System.out.println("max value: "+Collections.max(list));
		
		//3.Reverse
		Collections.reverse(list);
		System.out.println("after reverse: "+list);

		
	
	}

}
