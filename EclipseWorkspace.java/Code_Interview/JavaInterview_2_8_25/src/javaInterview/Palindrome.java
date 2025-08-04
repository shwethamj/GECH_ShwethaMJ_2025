package javaInterview;

import java.util.Scanner;

// Check whether the given string is palindrome or not ?
public class Palindrome {

	public static void main(String[] args) {

		System.out.println("enter a String :");
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		
		System.out.println("string length = "+str.length());
		String reversed ="";
        for (int i = str.length() - 1; i >= 0; i--) {
            reversed += str.charAt(i);
        }
	
		if (str.equals(reversed)){
			System.out.println("the string " + str + " is palindrome ");
		} else {
			System.out.println("the String " + str + " is not a  palindrome ");
		}

	}
}
