package com.Collection;

import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.PriorityQueue;
//import java.util.Queue;

public class ListInJava {

	public static void main(String[] args) {
		// LIST
		/*
		 * ==> it is a child interface of collection
		 * ==> it will contain some of the built in methods(.add, .remove,.contains , .removeAll , .clear , .containsall)
		  that used inside a list implemented classes only
		 * ==> when you represent a group of individual object as a single entity 
		 * where order is preserved and 
		 * index   based acceess and 
		 * duplicate is alloowed
		 */
		
		List list = new ArrayList();
		// 2 is a int but in collection it automaticaly convert dataype to objcet so here 2 is object
		list.add(2); //0
		list.add("hello");
		list.add(40.56);
		System.out.println(list);
		String str = (String) list.get(1); // unboxing -- object to string //typecasting
		System.out.println(str);
		double value =(double) list.get(2); // object to double
		System.out.println(value);
	
		Queue<Integer> que = new PriorityQueue<>();
		que.add(43);
		que.add(2);
		que.add(34);
		que.add(65);
		System.out.println(que);
		que.remove();
		System.out.println(que);
		}
	
}