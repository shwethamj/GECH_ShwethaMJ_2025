package com.linkedlist;

import java.util.LinkedList;
import java.util.List;

public class LinkedListInJava {

	public static void main(String[] args) {
		 
		/*
		 LINKED LIST
		 ============
		 * ==> linked list underline data structure is doubly linked list
		 * ==> linked list allows duplicate'
		 * ==>linked list allows random access
		 * ==>linked list will allow null value
		 * ==> linked list preserve the order of insertion
		 
		 
		 * linked list underline data structure is doubly linked list
		   arraylist dynamic array
		  
		 * linked list will occupy more memory (3 node) |__|2__|__|
		   ArrayList will occupy less memory
		  
		 * linked is very easy to delete element
		 
		 * whenever there is a continous operation "deletion and insertion " we should go for LinkedList
		   whenever there is a continous operation of "reading and random access " we should not go for ArrayList
		  
		 
		 */
		
		List<Integer> list = new LinkedList<>();
		list.add(43);
		list.add(43);  // duplicate
		list.add(null); // allow null
		list.add(23);
		list.add(30);
		list.add(35);
		//addFirst() and addLast()
		
		System.out.println(list);
		System.out.println(" element access using index : "+list.get(0));
		System.out.println("first element in list : " +list.getFirst()); 
		System.out.println("last element in list : "+ list.getLast()); 
		System.out.println("index of object : " +list.indexOf(43));
		System.out.println("remove element by index : "+list.remove(0)); //removefirst() and removelast()
		
		
	}

}
