package innerClass;

//method calling innerclass
public class InnerClass3 {

	class Engine{
		public String name ="shwetha";
		
	}
	
	public void method() {
		Engine en = new Engine();
		System.out.println(en.name);
	}
	
	
	public static void main(String[] args) {
		InnerClass3 out = new InnerClass3();
		out.method();
	}
}
