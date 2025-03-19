package access_specifier;

public class Employee {
	
		private int empId=20;
		private String empName="shwetha";
		// if we use private then it show not visible in output(error) so we use getters and setters
		
		//getters and setters (right click-source- select generate getters and selecters and select all)
		
		public int getEmpId() {
			return empId;
		}
		public void setEmpId(int empId) {
			this.empId = empId;
		}
		public String getEmpName() {
			return empName;
		}
		public void setEmpName(String empName) {
			this.empName = empName;
		}
		
	
}
