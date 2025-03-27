package com.Stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class StreamInJava {

	public static void main(String[] args) {
		// Stream
		List<Integer> list = new ArrayList<Integer>();
		list.add(34);
		list.add(43);
		list.add(66);
		list.add(55);
		
		// need to filter the odd numbers and display the list of that
		
		Stream<Integer> stream = list.stream();
		List<Integer> numbers = stream.filter((x)-> x%2!=0).collect(Collectors.toList());
		System.out.println("numbers: "+numbers);
		
		// OR
		
		
		// above one is other streama and below one another stream is craeted so termination is appling one for each stream
		// and we cannot use multiple terimation to one stream it shows the error
		List<Integer> number = list.stream().filter((x)-> x%2!=0).collect(Collectors.toList()); 
		System.out.println("num list: "+number);
		
		
		//collect -termination operation
		//collector is a interface so we use Collectors
	}

}
