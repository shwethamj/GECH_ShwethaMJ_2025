package com.set;


import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MapInJava {

	public static void main(String[] args) {
		
		/*
		 MAP:
		 ====
		 * when you represent a group of individual object as a single entity in the form of key value pair
		  then we should use map interface
		  
		 * it is in seprate in collection bcs it store in  key value pair 
		 * but it present in collections (collections includes the collection framework like list set collection iterable .. )
		 
		 * collections - which provide built in methods for collection 
		  
		 *can access through key value not by index
		 *duplicate key value not allowed
		 * gives in --> sorted(by key) map --> default ascending order
		 * allows null value not a null key
		 
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
		
		System.out.println("containes key 3 in map"+map.containsKey(3)); // o/p = false bcs 3 is removed
		System.out.println("containes value three in map"+map.containsValue("three")); // o/p =false
		System.out.println(map.containsValue("five"));// o/p =true bcs its present in map
		
		Set<Entry<Integer,String>> entryset =map.entrySet();
		for(Entry<Integer,String>keyValue : entryset) {
			System.out.println(keyValue);
		}
		
		System.out.println("using foreach :");
		map.forEach((k,v)->System.out.println(k+ "==> "+v));
		
		System.out.println("using keyset : ");
		
		
		
	}

}
