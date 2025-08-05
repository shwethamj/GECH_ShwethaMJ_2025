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
		
		/*
		 COLLECTIONS:
		 ==============
		 * its a utility classes that provide methods to work with collection
		  
		 * utility class --> Collections and Arrays
		 * Arrays --> only work for array and don't have in built  methods
		 * 
		 */
		
		// 1.SORT
		Collections.sort(list);// comparable used for --> default or natural sorting order (ascending order)
		System.out.println("after sort: " +list);
	
		//2. min and max in list
		System.out.println("min value: "+Collections.min(list));
		System.out.println("max value: "+Collections.max(list));
		
		//3.Reverse
		Collections.reverse(list);
		System.out.println("after reverse: "+list);
		
		Collections.shuffle(list);
		System.out.println("after shuffle: "+list);

		Collections.swap(list, 2, 1);
		System.out.println("after swaping 2 and 1 : "+list);

		
	
	}

}
