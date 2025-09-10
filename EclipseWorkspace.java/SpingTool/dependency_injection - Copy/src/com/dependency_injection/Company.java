package com.dependency_injection;

//setter injection
public class Company {

	private String e_name;
	private Car car ;
	
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) { //setter injection
		this.car = car;
	}
	
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	
	
public static void main(String[] args) {
	
	Car car = new Car();
	car.setC_name("shwetha");
	
	Company company = new Company();
	company.setE_name("sindhy");
	company.setCar(car); //setter injection
	
	System.out.println("car name : "+car.getC_name());
	System.out.println("companu name :"+company.getCar().getC_name());
	
	
	}
}
