package ArrayInJava;

//Array declaration
public class Array1 {

	public static void main(String[] args) {
		
		int []arr =new int[5];
		
		//more line of code so we use  the "for loop" 
		arr[0]=1;
		arr[1]=10;
		arr[2]=100;
		arr[3]=1000;
		arr[4]=1000;
		
		System.out.println("First element :"+arr[0]);
		System.out.println("second element :"+arr[1]);
		System.out.println("third element :"+arr[2]);
		System.out.println("fourt element :"+arr[3]);
		System.out.println("five element :"+arr[4]);
		System.out.println("six element :"+arr[5]); //array 5 out of bound excception
		
		
	}
}
