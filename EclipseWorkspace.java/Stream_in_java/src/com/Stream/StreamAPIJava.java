package com.Stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class StreamAPIJava {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		list.add(12);
		list.add(20);
		list.add(15);
		list.add(10);
		list.add(67);
		
		//map -->function and filter -> predicate
		
		Stream<Integer> stream = list.stream();
		Stream<Integer> filter = stream.filter(n->n%2 ==0);
		long count = filter.count();
		System.out.println("result of even number : "+count);
		
		//stream pipeline --> stream present in collection class 
		long count1 = list.stream().filter(n->n%2 !=0).count();
		System.out.println(" count result of odd number : "+count1);

	}
}
