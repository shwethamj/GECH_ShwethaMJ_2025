package stringBuffer_in_java;

public class StringBuffer_in_Java {

	/*
	 STRING BUFFER:
	 ==============
	 	*sequence of character
	 	* mutable
	 	*thread safe
	 	*the deafult capacity of stringBuffer ==>16
	 	*capacity ==> used to determine how much capacity the string buffer held
	 	*capacity = (initial capacity +1)*2 ( capacity increase like this) ==>16(initial capacity),34,70 
	 	
	 */
	/*
	 * Mutable :								immutable:
	  ========									==========
	 	ArrayList								String
		HashMap									All wrapper classes: Integer, Double, Boolean, etc.
		HashSet									LocalDate, LocalTime, LocalDateTime (Java 8+ Date/Time API)
		StringBuilder							BigInteger, BigDecimal	
		StringBuffer
		Date
	 */
	
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer();
		 sb.append("shwetha");
		 
		 System.out.println("String1 : "+sb);
		 System.out.println("initial capacity : "+sb.capacity()); //16
		 
		 sb.append("111111111111111111111111111");
		 System.out.println("String 2 :"+sb);
		 System.out.println("after completing 16 byte capacity : the capacity is  : "+sb.capacity());
		 
		 sb.append("1111111111111111111111111111");
		 System.out.println("String 2 :"+sb);
		 System.out.println("after completing 16 byte capacity : the capacity is  : "+sb.capacity());
	}
}
