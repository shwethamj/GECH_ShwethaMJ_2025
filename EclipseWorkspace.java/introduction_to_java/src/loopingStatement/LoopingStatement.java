package loopingStatement;

public class LoopingStatement {
	public static void main(String[] args) {
		/*
		 * for loop
		   	for(control statement){
		 				*
		   	}
		   	
		 * while loop
			 while(){
			 *
			 i++ (increment or decrement)
			 }
		 
		 * do-while loop
			 do{
			 *
			 *}while(condition)
		 
		 * for each loop
			int[] collection={1,2,3,4}
	 		for(<datatype> variable_name:collection){
	 		sys
	 		 etc...
	 		}
	 
		 */
		
		int a=7;
		
	//1.for loop	
		for(int i=0; i<a; i++) {
			System.out.println(i);
		}
		System.out.println("------------------------------------------------");
		
		
	//2.while loop
		
		while(a<=8) {
			System.out.println("while loop:"+a);
			a++;
		}
		System.out.println("------------------------------------------------");
		
		
	//3.do while
		do {
			System.out.println("do while:"+a);
			a++;
		}while(a<8);
		System.out.println("------------------------------------------------");
		
		
	//4.for each
		
		int[] num= {1,2,3,4,5};
		for(int n:num) {
			System.out.println("for each:"+n);
		}
		System.out.println("------------------------------------------------");
		
		
	}

}
