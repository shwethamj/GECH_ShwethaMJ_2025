package Loops;

import java.util.Scanner;

public class primenum_from1_N {

	public static void main(String[] args) {
		
		        Scanner sc = new Scanner(System.in);
		        System.out.print("Enter N: ");
		        int n = sc.nextInt();

		        for (int num = 2; num <= n; num++) {
		            boolean isPrime = true;
		            
		            for (int i = 2; i < num; i++) { // check all numbers before num
		                if (num % i == 0) {
		                    isPrime = false;
		                    break;
		                }
		            }
		            if (isPrime) {
		                System.out.print(num + " ");
		            }
		        }
		    
	}
}
