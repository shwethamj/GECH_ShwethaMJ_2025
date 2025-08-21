package Assignment;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

//FInd the Maximum element in List

public class MaxElement {

	public static void main(String[] args) {
		List<Integer> lis = Arrays.asList(10,5,1,67,80,100,5);

		int lis1 = lis.stream().distinct().max(Integer::compareTo).orElseThrow();
		System.out.println(lis1);
	}
}
