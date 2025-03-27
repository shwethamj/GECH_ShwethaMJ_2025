package com.predicatefunction;

import java.util.function.Consumer;

public class ConsumerInjava {

	public static void main(String[] args) {
		// CONSUMER
		/*
		 * it will consume the values but won't return anything
		 */
		
		Consumer<String> c = (s)->System.out.println(s); // here printing not returning
		c.accept("heloo");
	}

}
