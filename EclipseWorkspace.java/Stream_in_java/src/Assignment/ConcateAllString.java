package Assignment;

import java.util.Arrays;
import java.util.List;

// concatenate all list of strings into single string - reduce

public class ConcateAllString {

	public static void main(String[] args) {

		List<String> lis = Arrays.asList("shwetha"," ","m","j");

		String lis1 = lis.stream().reduce("",(a,b)->a+b);
		System.out.println(lis1);
	}
}
