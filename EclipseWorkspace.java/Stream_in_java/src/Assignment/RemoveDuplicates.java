package Assignment;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

// Remove the Duplicate elements from list

public class RemoveDuplicates {

	public static void main(String[] args) {
		List<Integer> lis = Arrays.asList(10,5,1,67,67,80,100,5,10);

		List<Integer> lis1 = lis.stream().distinct().collect(Collectors.toList());
		System.out.println(lis1);
	}
}
