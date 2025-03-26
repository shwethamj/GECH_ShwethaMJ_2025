package com.set;

import java.util.TreeMap;

public class TreeMapInJava {

	public static void main(String[] args) {
		
		TreeMap<Integer, String> treemap = new TreeMap<>((a,b)->a-b); // ascending orderr
		//for sorting it consider keyvalue
		
		treemap.put(3,"one");
		treemap.put(2,"two");
		treemap.put(2,"one");
		treemap.put(1,"thre");
		treemap.put(4,"four");
		
		System.out.println(treemap);
		
		treemap.remove(1);
		System.out.println(treemap);
		
		System.out.println(treemap.containsKey(1));
		System.out.println(treemap.containsValue("two")); // false bcs for keyvalue 2 = two is replaced by one 

	}

}
