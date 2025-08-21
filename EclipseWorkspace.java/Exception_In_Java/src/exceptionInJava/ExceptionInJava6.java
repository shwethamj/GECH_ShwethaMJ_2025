package exceptionInJava;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

// try with resources in java --> after java 7
public class ExceptionInJava6 {

	/*
	 * The try-with-resources statement, introduced in Java 7,  is a construct designed to 
	   simplify resource management by automatically closing resources that implement the AutoCloseable 
	   interface.This eliminates the need for explicit finally blocks to ensure resources are closed, even if exceptions occur.
	 */
	public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("example.text"))) {
            String line = reader.readLine();
            System.out.println("First line: " + line);
        } catch (IOException e) {
            System.err.println("An error occurred: " + e.getMessage());
        }
        
        /*
          In this example, the BufferedReader is declared within the try statement's parentheses.
          Regardless of whether readLine() throws an IOException or not, the reader.close() method
          will be automatically called when the try block exits, ensuring the file resource is released.
         */
    }
}
