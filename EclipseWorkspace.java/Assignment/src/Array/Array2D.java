package Array;

import java.util.Scanner;

public class Array2D {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("enter the size of row array");
		int size2 = sc.nextInt();
		System.out.println("enter the size of col array");
		int size1 = sc.nextInt();
		
		char[][] arr1= new char[size2][size1];
		
		System.out.println("enter the values");
		for(int k=0; k<size2;k++) {
			for(char l=0;l<size1;l++) {
				arr1[k][l]=sc.next().charAt(0);
			}
		}
		
			System.out.println("array elements are:");
			for(char k=0; k<size2;k++) {
				for(int l=0;l<size1;l++) {
					System.out.print(arr1[k][l]+" ");
				}
				System.out.println();
			}
			sc.close();
	}

}
