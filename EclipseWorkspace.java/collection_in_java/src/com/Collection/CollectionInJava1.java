package com.Collection;

import java.util.ArrayList;
import java.util.Collection;

public class CollectionInJava1 {

	public static void main(String[] args) {
		 
		
	/*
	 COLLECTION
	 ===========
		 * collection ==> root interface in collection framework
		 * Collections --> it will provide some of the utility methods to work with collection
		  
		 *COLLECTION
		 *==> when you represent a group of individual object as a single entity then we should go for collection
		 *==>collection is root interface in collection framework
		 *==> this will provide some of the built-in methods to work with any collection class 
		 *==> collection is allows heterogeneous data like we can insert multiple datatypes into array
		 *==>collection automatically converts the primitive datatypes to object
		 *==>cannot create a object dirctly to collection because it is interface so need to use classes(ArrayList.LinkedLIst,HashSet,priorityQueue)
	 
		
		 * collection has child intefaces --> lists ,queue , sets and map
		 * lists classes --> ArrayList.LinkedLIst,vector,stack
		 * queue --> priorityQueue and Deque --ArrayDeque
		 * set --> HashSet, LinkedHashSet , for sorting Sortedset --TreeSet
		 * map --> HashMap,LinkedHashMap,Hashtable, for sorting -TreeMap
	*/
		
		//Collection is a object which includes built in functions like ArrayList()
		Collection collection = new ArrayList(); //no type safety
	
		collection.add(10);
		collection.add("name");
		collection.add(10.34); 
		collection.remove(10); //delete 10 from list
		
		System.out.println(collection); //object is directly printing bcs tostring was included in the imorted collection above

		collection.addAll(collection); 
		System.out.println(collection);
		
		System.out.println(collection.contains(10));
		System.out.println(collection.equals(collection)); //pass other obj
		System.out.println(collection.hashCode()); // Returns the hash code value for this collection.
		System.out.println(collection.isEmpty());// false
		collection.clear();
		System.out.println(collection); //output = [] ==> empty (it clear all data from arraylist)
		 
	}

}
