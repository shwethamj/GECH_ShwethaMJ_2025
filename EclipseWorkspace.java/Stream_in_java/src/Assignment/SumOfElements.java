package Assignment;

import java.util.Arrays;
import java.util.List;

//calculate the sum of elements in the list - reduce

public class SumOfElements {

	public static void main(String[] args) {

		List<Integer> lis = Arrays.asList(10,5,1,67,80,100,5);

		int lis1 = lis.stream().reduce(0, (a,b)->a+b);
		System.out.println(lis1);
	}
}
