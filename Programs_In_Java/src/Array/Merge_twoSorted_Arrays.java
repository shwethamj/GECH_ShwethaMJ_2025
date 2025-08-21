package Array;

import java.util.Scanner;

public class Merge_twoSorted_Arrays {

	public static void main(String[] args) {
		Scanner sc =new Scanner(System.in);
		
		//first array
		System.out.println("enter first array size ");
		int n1 = sc.nextInt();
		
		int[] arr1 = new int[n1];
		System.out.println("enter "+n1 + "elements" );
		for(int i =0 ;i<n1;i++) {
			arr1[i]= sc.nextInt();
		}
		
		//second array
		System.out.println("enter first array size ");
		int n2 = sc.nextInt();
		
		int[] arr2 = new int[n2];
		System.out.println("enter "+n2 + "elements" );
		for(int i =0 ;i<n2;i++) {
			arr2[i]= sc.nextInt();
		}
		
		//merging array
		int[] mergedArray = new int[n1+n2];
		int i=0,j=0,k=0;
		
		//checking elements and sorting 
		while(i<n1 && j<n2) {
			mergedArray[k++] = (arr1[i]<arr2[j] ? arr1[i++]:arr2[j++]);
		}
	/*
		The first while loop(above one) stops when one of the arrays is exhausted.
		The other array might still have unmerged elements (which are already sorted).
		The last two loops simply append those leftovers to the merged array.while(i<n1) {
	*/
		while(i<n1) {
		mergedArray[k++] = arr1[i++];
		}
	
		while(j<n2) {
			mergedArray[k++] = arr2[j++];
		}
		for(int x :mergedArray) {
			System.out.println(x + " ");
		}
	
//		for(int l=0;l<mergedArray.length;l++) {
//			System.out.println("the merged elemnt : "+mergedArray[l]);
//	
//		}
		}
}
