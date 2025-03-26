package com.Collection;

import java.util.ArrayList;

public class ArrayListDemo {

	public static void main(String[] args) {
		// ARRAYLIST
		/*
		 * ==>ArrayList is a improved version of array(dynamic Array ==> means array can grow and strink)
		 *==> ArrayList underline a data structure called Dynamic Array
		 * ==> ArrayList alloows duplicate
		 * ==> ArrayList allow random access i.e can access any elements throughout the array using index number
		 * ==>Arraylist will allow null values
		 * ==>it will preserve the order of insertion similar to list
		 * 
		 */
		
		//ArrayList accepting a generic value
		ArrayList<Integer> list = new ArrayList<Integer>(); // here size not mentioned so it can be grow and strink called dynamic array
		list.add(1);
		list.add(2);
		list.add(2);  // duplicate value
		list.add(3);
		list.add(null); // null value
		list.add(null);
		list.add(89);
		list.add(1);
		
		System.out.println(list);
		System.out.println(list.get(1)); // random access
		System.out.println("size:"+list.size()); // to get size of array
		
		list.remove(0); // by index
		System.out.println(list);
		
		list.remove(2); // by object
		System.out.println(list);
		
		Integer i =2 ; // asigning 2 to i 
		System.out.println(list);
		list.remove(i); // if multiple 2 present it remove the last one 
		System.out.println(list);
		
		list.clear();
		System.out.println(list);
		
	}

}
