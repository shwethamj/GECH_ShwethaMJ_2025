package com.Collection;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Vector;

public class ArrayListDemo1 {

	public static void main(String[] args) {
	//List<Integer> list = new ArrayList();t is also right
		List<Integer> list = new ArrayList<>();
		list.add(2);
		list.add(3);
		list.add(10);
		list.add(5);
		
	// different ways to  iterate through arrayList
		 	
	// 1.using traditional for loop
		
		System.out.println("using for loop:");
		for (int i =0; i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		System.out.println();
		
	
	//2. for each 
		System.out.println("using for each :");
		for(int i :list) { //for each element in list
			System.out.println(i+" ");
		}
		System.out.println();
		
	
	//3. forEach
		System.out.println("using forEach :");
		list.forEach(i -> System.out.println(i+ " ")); // here -> is called as arrow operator or lambda expression in javaa
		System.out.println();
		
		
	//4. iterator(for more traversal control) ==> can use for any collection class ==> uni-direction(forword)
		// Iterator (it is interface) in java we can also use this
		System.out.println("using iterator:");
		Iterator<Integer> list1 = list.iterator();
		while(list1.hasNext()) {
			// int i = list1.next
			System.out.println(list1.next()+" ");
	}
		
	//5. ListIterator  ==>bi directional(forword and backward) --> only use for list interface
		ListIterator list2 = list.listIterator();
		System.out.println(" using listIterator (forward) :");
		while(list2.hasNext()) {
			System.out.println(list2.next());
		}
		System.out.println(" using listIterator(backward) :");
		while(list2.hasPrevious()) {
			System.out.println(list2.previous());
		}

	//6. Enumeration
		Vector vec = new Vector();
		vec.add("hello");
		vec.add(1234);
		
		System.out.println("using enumeration :");
		Enumeration em = vec.elements();
		while(em.hasMoreElements()) {
			System.out.println(em.nextElement());
		}
		
		
	}

}
