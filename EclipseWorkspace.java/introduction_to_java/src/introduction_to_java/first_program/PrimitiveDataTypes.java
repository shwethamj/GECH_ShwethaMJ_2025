package introduction_to_java.first_program;

public class PrimitiveDataTypes {
	
	public static void main(String[]args) {
		//DAta types -- 1.primitive datatype and 2.non-primitive
        /*
         * primitive datatypes
         * 1.byte(default value=0) --> 8 bit  --> -128 to 127
         * 2.short (default value=0) --> 16bit --
         * 3.int (default value=0) --> 32 bit
         * 4.long (default value=0l) -->64bit
         * 5. float- ex= 9.8f (default value= 0.0f) -->32 bit
         * 6.double (default value =0.0) -->64 bit
         * 7.char (default='')      -->16 bit (2 byte)
         * 8.boolean(default value=false) --> 1 bit
         */
		
		//DECLARATION OF VARIABLES
		/*
		 * variable is a container used to store a value based on the datatype
		 * <datatype> varible_name;
		 */
		
		byte age;
		// everone is samml letter like byte long int etc..
		
		//Initialization: variable_name=value;
		age=20;
		
		//OR
		//<datatype> variable_name=value
		byte age1 = 34;
		System.out.println(age);
		System.out.println(age1);
		
		
		long one=3400000L;
		System.out.println(one);
		
		short two=23;
		System.out.println(two);
		
		int three=25;
		System.out.println(three);
		
		float four=6.5f;//until 7 decimal ,if i dont use f by defuslt it consider as double & throws exception so for float use f
		System.out.println(four);
		
		double five=54.6;
		System.out.println(five);
		
		char six=675;
		System.out.println(six);
		
		char six1='a';
		System.out.println(six1);
		
		boolean sev=true;
		System.out.println(sev);
		
		//scanner-used to take a userinput
		
		
		
		
	}

}
