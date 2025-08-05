package String;

public class VoweilCount {

	public static void main(String[] args) {
		
		int[] vowel = {'a','e','i','o','u'};
		
		String str ="shwetha";
		char[] str1 = str.toCharArray(); //converting to character array
		int count =0;
		
		for(int i=0;i<str1.length;i++) {
			for(int j=0;j<vowel.length;j++)
			if(str1[i]==vowel[j]) {
				count ++;
			}
		}
		
		System.out.println("count of vowels in string : "+count);
	}
}
