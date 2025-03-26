package com.Collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
		
		for (int i =0; i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		System.out.println();
		
	
	//2. for each
		for(int i :list) {
			System.out.println(i+" ");
		}
		System.out.println();
		
	
	//3. forEach
		list.forEach(i -> System.out.println(i+ " ")); // here -> is aclled as arrow operator or lambda expression in javaa
		System.out.println();
		
		
	//4. iterator(for more traversal control)
		// there is a Iterator (it is interface) in java we can also use
		Iterator<Integer> list1 = list.iterator();
		while(list1.hasNext()) {
			// int i = list1.next
			System.out.println(list1.next()+" ");
	}
	}

}
