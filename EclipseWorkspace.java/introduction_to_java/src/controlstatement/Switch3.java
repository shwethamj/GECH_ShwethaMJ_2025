package controlstatement;

public class Switch3 {
	public static void main(String[] args) {
		Object obj =87;
		switch(obj) {
		case String s->System.out.println("String type");
		case Integer i->System.out.println("Integer type");
		default ->System.out.println("inavlid");
		}
	}
}
