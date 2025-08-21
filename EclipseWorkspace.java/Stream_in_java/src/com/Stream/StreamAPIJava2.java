package com.Stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class StreamAPIJava2 {

	public static void main(String[] args) {
		List<String> names = Arrays.asList("mohan","shwetha","pavan");
		
		names.stream().map(s->s.toUpperCase()).forEach(s->System.out.println(s));
		
		//using method reference --used bcs each object(names) need to pass
		//toUpperCase is instance method in String class
		//system --> class, out -->static method, println -->instance method
		names.stream().map(String::toUpperCase).forEach(System.out::println);
		System.out.println("--------------------------------------");


		//print the list start with
		List<String> names1 = Arrays.asList("mohan","shwetha","pavan");
		names1.stream().filter(s-> s.startsWith("m")).forEach(System.out::println);

		//names1.stream().filter(String::startsWith("m")).forEach(System.out::println);;

		
		//collect - when want return new list
		List<String>collect = names1.stream().filter(s-> s.startsWith("m")).collect(Collectors.toList());
		System.out.println("using collect : "+collect);
	}
}
