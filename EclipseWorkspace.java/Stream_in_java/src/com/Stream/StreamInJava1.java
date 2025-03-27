package com.Stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class StreamInJava1 {

	public static void main(String[] args) {
		// after applying the termination operation on stream  we cannot reuse it
		// for each stream we can use only one termination operation
		// exmple :
		
		
		List<Integer> list = Arrays.asList(12,4,5,65,87,1);
		Stream<Integer> stream =list.stream().filter(x ->x>10);
		Long res = stream.count();
		System.out.println("count of no > 10: "+res);
		
		
		// stream is already closed by count termination adn we use below collect operation again 
		// it shows the error ==> stream has already been operated upon or closed
		List<Integer> result1 = stream.collect(Collectors.toList());
		System.out.println(result1);
		
		Long res1 = stream.count(); // only one termination operartion for one stream multiple cannot be used it shows the eroor
		System.out.println(res1);

	}

}
