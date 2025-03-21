package functionsinjava;

public class FonctionInJava2 {

	
		// TODO Auto-generated method stub
		//1. public functions
		// -->anywhere
		public void publicFunction() {
			System.out.println("this is public gunction");
		}
		
		//2. private function
		//-> within class
		private void privateFunction() {
			System.out.println("this is private function");
		}
		
		//3. default function
		// within the package
		void defaultFunction() {
			System.out.println("this is default  function");
		}
		
		//4.protected function
		// within package and subclass in other package
		protected void protectedFunction() {
			System.out.println("this is protected function");
		}
		
		//5.static function
		// we can access by using class name
		static void staticFunction() {
			System.out.println("this is static function");
		}
		
		public static void main(String[] args) {
			FonctionInJava2 obj = new FonctionInJava2();
			obj.publicFunction();
			obj.defaultFunction();
			obj.privateFunction();
			obj.protectedFunction();
			FonctionInJava2.staticFunction();
			}
	

}
