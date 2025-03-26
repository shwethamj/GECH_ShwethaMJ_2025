package com.linkedlist;

import java.util.LinkedList;
import java.util.List;

public class LinkedListInJava {

	public static void main(String[] args) {
		// LINKED LIST
		/*
		 * ==> linked list underline data structure is doubly linked list
		 * ==> linked list allows duplicate'
		 * ==>linked list allows random access
		 * ==>linked list will allow null value
		 * ==> linked list preserve the order of insertion
		 */
		
		List<Integer> list = new LinkedList<>();
		list.add(43);
		list.add(43);  // duplicate
		list.add(null); // allow null
		list.add(23);
		list.add(30);
		list.add(35);
		System.out.println(list);
		System.out.println(list.get(0)); //random access
		
		/*
		 * linked list underline data structure is doubly linked list
		 * arraylist dynamic array
		 * 
		 * linked list will occupy more memory (3 node) |__|2__|__|
		 * ArrayList will occupy less memory
		 * 
		 * linked is very easy to delete element
		 * when ever there is a continous operation deletion we should go for LinkedList
		 * when ever there is a continous operation deletion we should not go for ArrayList
		 * 
		 */
	}

}
