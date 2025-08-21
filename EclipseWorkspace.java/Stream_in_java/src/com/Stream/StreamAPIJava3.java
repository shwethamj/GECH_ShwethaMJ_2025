package com.Stream;


import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StreamAPIJava3 {

	public static void main(String[] args) {
		
		//if number greater 10 in list need square that number and store in another list
		List<Integer> list = Arrays.asList(11,20,10,5,30,12);
		
		List<Integer> list1 = list.stream().filter((x)->x>10).map(x->x*x).collect(Collectors.toList());
		System.out.println(list1);

		
	}
}
