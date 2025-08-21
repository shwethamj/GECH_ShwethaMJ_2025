package Assignment;

import java.util.Arrays;
import java.util.List;

//Find the Second Max Element List

public class SecMax {

	public static void main(String[] args) {
		List<Integer> lis = Arrays.asList(10,5,1,67,80,100,5);

		int lis1 = lis.stream().distinct().sorted((a,b)->b-a).skip(1).findFirst().orElseThrow(null);
		System.out.println(lis1);
	}
}
