package Assignment;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

//Sorting numbers in descending order

public class SortingNumbers {

	public static void main(String[] args) {
		List<Integer> lis = Arrays.asList(10,5,1,67,80,100);
	
		List<Integer> lis1 = lis.stream().sorted((a,b)->b-a).collect(Collectors.toList());
		System.out.println(lis1);
	}
}
