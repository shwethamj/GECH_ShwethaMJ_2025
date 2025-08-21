package Assignment;

import java.util.Arrays;
import java.util.List;

// 8. Check all the numbers in the list is greater than 100 - allMatch

public class AllMatch {

	public static void main(String[] args) {

		List<Integer> lis = Arrays.asList(1000,500,800,100);

		boolean lis1 = lis.stream().allMatch(n->n>=100);
		System.out.println(lis1);
	}
}
