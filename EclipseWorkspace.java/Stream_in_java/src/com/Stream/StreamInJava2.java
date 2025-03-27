package com.Stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StreamInJava2 {

	public static void main(String[] args) {
		List<String> list = Arrays.asList("shwe","dilee","radha","jithya");
		System.out.println("list : "+list);
		List<String> new_list = list.stream().map((s)->s.toUpperCase()).collect(Collectors.toList());
		System.out.println("uppercase list: "+new_list);

	}
	// student detaiils marks >60

}
