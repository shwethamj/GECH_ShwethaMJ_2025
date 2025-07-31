package ArrayInJava;

import java.util.Scanner;

//pyramid
public class TwoDArray2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("enter the size of row array");
		int row= sc.nextInt();
		
		int[][] arr1= new int[row][];
		
		
		for(int i=0;i<row;i++) {
			System.out.println("enter the how much elements needed in one row ");
			int col = sc.nextInt();	
			
			 arr1[i]=new int[col];
			 System.out.println("enter"+col+" element ");
			 for (int j = 0; j < col; j++) {
	                arr1[i][j] = sc.nextInt();
	            }
		}
		
		System.out.println("array elements are:");
		for(int k=0; k<arr1.length;k++) {          //for row
			for(int l=0;l<arr1[k].length;l++) {      //for column
				System.out.print(arr1[k][l]+" ");
			}
			System.out.println();  //after number column need to go to next line
		}
		
		
		
		
		
		
	}
}
