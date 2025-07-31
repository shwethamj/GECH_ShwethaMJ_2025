package ArrayInJava;

import java.util.Scanner;

public class TwoDArray {

	public static void main(String[] args) {
		
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
		
		int sum=0;
		int max=arr1[0][0];
		int min =arr1[0][0];
		
//		sum
		for(int i=0;i<arr1.length;i++) {
			for(int j=0; j<arr1[i].length;j++) {
				sum = sum + arr1[i][j];				
			}
		}
		System.out.println("sum = "+sum);
		
		for(int m=0;m<arr1.length;m++) {
			for(int n=0; n<arr1[m].length;n++) {
				if(arr1[m][n]>max) {
					max = arr1[m][n];
				}
				if(arr1[m][n]<min) {
					min=arr1[m][n];
				}
			}		
		}
		
		System.out.println("max = "+max);
		System.out.println("min = "+min);
		
		
	}
}
