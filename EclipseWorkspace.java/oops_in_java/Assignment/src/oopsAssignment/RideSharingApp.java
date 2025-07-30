package oopsAssignment;

//abstraction
abstract class User{
//encapuslation
	private String name;
	private int phone;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
//constructor
	public User(String name, int phone) {
		super();
		this.name = name;
		this.phone = phone;
	}
	//abstract method
	public abstract void showprofile();
}

//inheritance
class Driver extends User{
	String vehical;
	public Driver(String name, int phone,String vehical) {
		super(name, phone);
		this.vehical=vehical;
	}
	@Override
	public void showprofile() {
		System.out.println("the Driver name is : "+getName()+"  phone number is : "+getPhone()+ " has vehical " +vehical);
		
	}
	
}
//inheritance
class Customer extends User{
	String location;
	public Customer(String name, int phone,String location) {
		super(name, phone);
		this.location=location;
	}
	@Override
	public void showprofile() {
		System.out.println("the Customer name is : "+getName()+"  phone number is : "+getPhone()+ " has to pickup from : " +location);
	
	}	
	
}

//polymorphism
interface Ride{
	public void book(String from ,String to);
}

class UberRide implements Ride{

	@Override
	public void book(String from, String to) {
		System.out.println("your destination is from : "+from+" to : "+to);
		
	}
	
}
public class RideSharingApp {

	public static void main(String[] args) {
		Customer c = new Customer("shwetha",123456,"AGBlayout");
		c.showprofile();
		
		Driver d = new Driver("Sindhu",112345,"Car");
		d.showprofile();
		
		UberRide u = new UberRide();
		u.book("AGB layout", "Majestic");
	}

}
