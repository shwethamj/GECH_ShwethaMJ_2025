package com.set;

import java.util.HashMap;
import java.util.Map;

public class MapInJava {

	public static void main(String[] args) {
		//MAP
		/*
		 * ==> when you represent a group of individual object as a single entity in the form of key value pair
		  then we should use map interface
		 */
		
		Map<Integer,String> map = new HashMap<>();
		map.put(1,"one" );
		map.put(1,"two" ); // same keyvalue , so ONE will replace by TWo
		map.put(3,"three" );
		map.put(4,"four" );
		map.put(5,"five" );
		System.out.println(map);
		
		map.remove(3);
		System.out.println(map);
		System.out.println(map.containsKey(3)); // o/p = false bcs 3 is removed
		System.out.println(map.containsValue("three")); // o/p =false
		System.out.println(map.containsValue("five"));// o/p =true bcs its present in map
		
		
		
	}

}
