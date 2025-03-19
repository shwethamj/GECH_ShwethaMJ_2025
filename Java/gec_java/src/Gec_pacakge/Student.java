

/*
 constructor = it  is a special tyoe of ethod this will used to assign the values for instance variables/states
	 
	 * rules:
	 * ========
	 * 1. name of constructor should same as the class name 
	 * 2. constructor will not have a return type
	 * 3.constructor will assign values  to instamce variables using the keyword
	  
	 * syntax:
	 * =========
	 * <access specifier - public classname(value from object){
	 * //code to assign values
	 * }
	 
*/

package Gec_pacakge;

public class Student {


	//status
	public int stdID; // default integer value is 0
	public String stdName; // default string value is null
	
	public Student(int stdID, String stdName) {   //constructor 
		this.stdID = stdID;
		this.stdName = stdName;
	}
	
	
}
