package introduction_to_java.first_program;

import java.util.Scanner;

public class Studentdata {

	public static void main(String[] args) {

		byte age;
		char gender;
		double marks;
		String name;

		Scanner sc = new Scanner(System.in);

		System.out.println("enetr a age");
		age = sc.nextByte();

		System.out.println("enter gender");
		gender = sc.next().charAt(0);

		System.out.println("enter marks");
		marks = sc.nextDouble();
		
		//sc.next ==> if i use this instead below line then name will skip ,
		//if i give name while gving a marks then name will displY in name sysyo (eneter marhs :50 shwetha m j)
		sc.nextLine(); // If you previously used something like sc.nextInt() or sc.next(), they do not
						// consume the newline (\n) after the input. So when you call sc.nextLine()
						// right after that, it immediately reads the leftover newline, not your actual input.
		System.out.println("enter name");
		name = sc.nextLine();

		System.out.println("age : " + age);
		System.out.println("gender : " + gender);
		System.out.println("marks : " + marks);
		System.out.println("name :" + name);
	}

}
