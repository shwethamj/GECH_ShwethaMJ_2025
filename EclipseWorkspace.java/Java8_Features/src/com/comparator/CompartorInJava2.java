package com.comparator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class CompartorInJava2 {
 
	public static void main(String[] args) {
		
		List< Integer> marks = new ArrayList<Integer>();
		marks.add(10);
		marks.add(100);
		marks.add(20);
		marks.add(50);
		
		
		System.out.println("before sort : "+marks);
		
		Collections.sort(marks, (a,b)-> a-b);
		System.out.println("after sorting ascending : "+marks);
		
		Collections.sort(marks, (a,b)-> b-a);
		System.out.println("after sorting in descending : "+marks);
	}
}
