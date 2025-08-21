package method_Constructor_Reference;

import java.util.function.Consumer;

public class StaticMethodReference {

	public static void printmessage(String msg) {
		System.out.println("your msg is : "+msg);
		
	}
	
	public static void main(String[] args) {
		//method reference reduce the code 
		//without static method reference
		Consumer<String> cons1 = s->StaticMethodReference.printmessage(s);
		cons1.accept("without refrence");
		
		//with static method reference --> classname :: Static_methodName;
		Consumer<String> cons2 = StaticMethodReference::printmessage;
		cons2.accept("with static method refrence");
	}
}
