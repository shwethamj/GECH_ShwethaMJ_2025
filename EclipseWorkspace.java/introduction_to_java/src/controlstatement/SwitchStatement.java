package controlstatement;

public class SwitchStatement {
	public static void main(String[] args) {
		// this type of switch start using after 8th version
	
	int day=2;
	System.out.println("the day is:\n");
	
	switch(day) {		
		case 1 ->System.out.println("monday");
		case 2 ->System.out.println("Tuesday");
		case 3 ->System.out.println("wednesday");
		case 4 ->System.out.println("Thursday");	
		case 5 ->System.out.println("friday");
		case 6 ->System.out.println("saturday");
		case 7 ->System.out.println("Sunday");
		default ->System.out.println("Inavalid");
	}
 }	

}
