package com.set;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SetInJava {

	public static void main(String[] args) {
		//SET
		/*
		 * ==>set is a child inteface of collection
		 * ==> where you represent a group of individual object as a single entity,
		 * ==> where the insertion order is not preserved
		 *==> set will not allow duplicate values
		 *==> when we dont want use  duplicate values best go for set
		 
		 *1. no presrved order
		 *2. not allow duplicate
		 *3. no random access is there
		 */
		
		Set<Integer> set = new HashSet<>(); //hashSet is subclass of set interface
		set.add(2);
		set.add(6);
		set.add(2); // duplicate value not allow
		set.add(null);
		set.add(43);
		set.add(45);
		set.add(34);
		
		System.out.println(set); // o/p :[null,2,34,6,43,45]
		System.out.println(set);
		
		//if we want to delete dulicates in list we use Set
		List<Integer> list = new ArrayList<>();
		list.add(2);
		list.add(64);
		list.add(2); 
		list.add(76);
		list.add(65);
		list.add(null);
		list.add(34);
		
		System.out.println("Lists: "+list);
		
		Set<Integer> set1 = new HashSet<Integer>(list);
		System.out.println("set1: "+set1);
		
	}

}
