package com.Stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StreamAPI4 {

	public static void main(String[] args) {
		
		//list inside list
		List<List<Integer>> lis = Arrays.asList(Arrays.asList(1,2),Arrays.asList(6,5));
		System.out.println(lis); //[1,2][6,5]
		System.out.println(lis.get(0));//[1,2]
		System.out.println(lis.get(0).get(0)); //1
		
		System.out.println("---------------------------");
		
		//using flatMap
		//flatMap - convert the nested array list to single list
		System.out.println("before : "+lis);
		List<Integer> flattenedlist = lis.stream().flatMap(c ->c.stream()).collect(Collectors.toList());
		System.out.println("after : "+flattenedlist);
	
	
	}

}
