package com.Collection;

import java.util.ArrayList;
import java.util.Collection;

public class CollectionInJava1 {

	public static void main(String[] args) {
		// COLLECTION
		
		/*
		 * collection ==> root interface in collection framework
		 * Collections --> it will provide same of the utility methods to work with collection
		  
		 *COLLECTION
		 *==> when you represent a group of individual object as a single entity then we should go for collection
		 *==>collection is root interface in collection framework
		 *==> this will provide some of the built-in methods to work with any collection class 
		 *==> collection is allows heterogeneous data like we can insert multiple datatypes into array
		 *==>collection automatically converts the primitive datatypes to object
		 */
		
		/*
		 * collection has child intefaces lists ,queue , sets and map
		 * lists has classes --ArrayList.LinkedLIst,vector,stack
		 * queue - priorityQueue and Deque --ArrayDeque
		 * set --HashSet, LinkedHashSet , for sorting Sortedset --TreeSet
		 * map -- HashMap,LinkedHashMap,Hashtable, for sorting -TreeMap
		 */
		
		//Collection is a object which includes built in functions like ArrayList()
		Collection collection = new ArrayList();
		// ctrl +click on the Collection (above one) to see describe
		collection.add(10);
		collection.add("name");
		collection.add(10.34);
		collection.remove(10); //delete 10 from list
//		collection.clear() // output =[] =empty (it clear all data from arraylist)
		 
		System.out.println(collection); //object is directly printing bcs tostring was included in the imorted collection above
	}

}
