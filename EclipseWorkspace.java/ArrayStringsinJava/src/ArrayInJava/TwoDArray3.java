package ArrayInJava;

import java.util.Scanner;

//array traingle
public class TwoDArray3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("enter the size of row array");
		int row= sc.nextInt();
		
		for(int i=0;i<row;i++) {
			for(int j=0;j<=i;j++) {
				System.out.print((i+1) + " ");
			}
			System.out.println();
		}
		
		//array traingle in reverse 
		for (int i = row; i >= 1; i--) {
			for (int j = 1; j <= i; j++) {
				System.out.print(i + " ");
			}
			System.out.println();
		}
		
		
	}
}
