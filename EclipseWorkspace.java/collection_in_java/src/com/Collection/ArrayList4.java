package com.Collection;

import java.util.ArrayList;
import java.util.Collections;

public class ArrayList4 {

	public static void main(String[] args) {
		/*
		 * COMPARATOR AND COMPARABLE
		 =============================
		 1.Comparable :
		 	 ==> if u need default ot natural sorting order thenwe should go for comparable
		 	 ==> collections.sort defaulty extends the Comparable interface
		 2.Comparator :
		 	 ==> if u need custom sorting order thern we go for comparator interface
		 	 ==> * a negative integer if o1 should come before o2
		 	 	 * zero if o1 and o2 are considered euqal for sorting purpose
		 	 	 * a positive integer if o1 should come after o2
		 */
		
		
		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(10);
		arr.add(100);
		arr.add(25);
		arr.add(12);
		arr.add(6);
		
		System.out.println("array list : "+arr);
		
		//1.comparable 
		Collections.sort(arr);
		System.out.println("using comparable : "+arr);
	
		// 2. comparator :
		Collections.sort(arr, (a1,a2)->a2-a1);
		System.out.println("using comparator : "+arr);
		
		/*
		 * a1 =10
		 * a2=100
		 * a2-a1 = 100-10 =90 = +ve integer
		 * so ==> a2 first and a1 second ==> [100,10,25,12,6]
		  
		 * a1= 10
		 * a2 = 25 
		 * a2-a1 = 25- 10 = 15 ==> +ve integer 
		 * so ==> a2 comes before a1 ==> [100,25,10,12,6]
		 */
	}
}
