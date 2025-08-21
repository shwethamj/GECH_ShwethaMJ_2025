package innerClass;

import innerClass.University.Depart1;

//access the innerclass of otherclass


class University{
	class Depart1{
		public String name ="shwethu";
	}
}

public class InnerClass4 {

	public static void main(String[] args) {
		University u1 = new University();
		Depart1 dept = u1.new Depart1();
		System.out.println(dept.name);
	}
}
