package com.dependency_injection;

//FIELD INJECTION :  we need filed/instance variable
public class AEmployee {
	public String e_name;
	public Address address;
	
//getter setter for address
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}


public static void main(String[] args) {
		
		AEmployee emp = new AEmployee();
		System.out.println("Before : \n-----------");
		System.out.println(emp.e_name);
		System.out.println(emp.address);
		System.out.println();
		
		Address add = new Address();
		add.a_name ="bangalore";
		add.a_place ="karntaka";
		
		emp.e_name="shwetha";
		emp.address = add; //Field injection
		
		System.out.println("After : \n---------------------------");
		System.out.println(emp.e_name);//shwetha
	
		System.out.println(emp.address); //hash code / address
		System.out.println(emp.address.a_name); // bangalore
		System.out.println(emp.address.a_place);//karnataka
		System.out.println("--------------------------");
	
//setter injection 
		add.setName("radha");
		emp.setAddress(add);//setter injection
		System.out.println(add.getName());
		System.out.println(emp.getAddress()); //hashcode
 }	
}
