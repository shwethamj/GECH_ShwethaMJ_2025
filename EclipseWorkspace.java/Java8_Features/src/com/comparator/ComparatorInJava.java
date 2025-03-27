package com.comparator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

// comparator is a built in inteface we access by implemting/import that

class FuncInterface implements Comparator<Integer>{

	@Override
	public int compare(Integer o1, Integer o2) {
		return o1-o2;
	}
	
}

public class ComparatorInJava {

	public static void main(String[] args) {
		
		List<Integer> list = new ArrayList<>();
		list.add(76);
		list.add(56);
		list.add(49);
		list.add(76);
		
		Collections.sort(list);
		System.out.println(list);
		
		Collections.sort(list, new FuncInterface()); // calling our class FuncInterface that has the method compare thats sort from o1 to o2
		System.out.println(list);
		
		
		Collections.sort(list,(a,b)-> b-a); // it works same as a above sort but it was using lambda expression
		System.out.println(list);
		
		}
	

}
