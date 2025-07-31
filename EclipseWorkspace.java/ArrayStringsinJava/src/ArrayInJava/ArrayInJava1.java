package ArrayInJava;

import java.util.Scanner;

public class ArrayInJava1 {
	public static void main(String[] args) {
		//2D Array
		
		int[][] arr=new int[2][2];
		arr[0][1]=20;
		arr[0][0]=10;
		arr[1][1]=30;
		arr[1][0]=50;
		
		for(int i=0; i<2;i++) {
			for(int j=0;j<2;j++) {
				//System.out.println = it prints in column like one in one line next in next line
				//System.out.print = it print all in one line
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
		
		
		Scanner sc = new Scanner(System.in);
		System.out.println("enter the size of row array");
		int size2 = sc.nextInt();
		System.out.println("enter the size of col array");
		int size1 = sc.nextInt();
		
		int[][] arr1= new int[size2][size1];
		
		System.out.println("enter the values");
		for(int k=0; k<size2;k++) {      //for row
			for(int l=0;l<size1;l++) {	 //for column
				arr1[k][l]=sc.nextInt();
			}
		}
		
			System.out.println("array elements are:");
			for(int k=0; k<size2;k++) {          //for row
				for(int l=0;l<size1;l++) {      //for column
					System.out.print(arr1[k][l]+" ");
				}
				System.out.println();  //after number column need to go to next line
			}
			sc.close();
	}

}
