package method_Constructor_Reference;

import java.util.function.Supplier;

public class InstanceMethodReference {

	public String getmessage() {
		return "this is instance method";
		
	}
	public static void main(String[] args) {

		InstanceMethodReference inst = new InstanceMethodReference();
		
		//without reference :
		Supplier<String> sup1 = ()->inst.getmessage();
		System.out.println(sup1.get());
		
		//with reference --> objName::instance_methodName;
		Supplier<String> sup2 = inst :: getmessage;
		System.out.println(sup2.get());
	}

}
