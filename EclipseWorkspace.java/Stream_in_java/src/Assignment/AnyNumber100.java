package Assignment;

import java.util.Arrays;
import java.util.List;

// Check if any numbers in the list is greater than 100 - anyMatch

public class AnyNumber100 {

	public static void main(String[] args) {

		List<Integer> lis = Arrays.asList(10,500,1,67,80,100,5);

		boolean lis1 = lis.stream().anyMatch(n->n>100);
		System.out.println(lis1);
	}
}
