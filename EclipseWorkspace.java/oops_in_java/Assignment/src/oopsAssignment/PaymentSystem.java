package oopsAssignment;

//INTERFACE

interface Payment{
	public void pay(double amount);
}

class Cardpayment implements Payment{

	@Override
	public void pay(double amount) {
		System.out.println("You payed amount of "+amount+ " through CardPayment");
		
	}
	
}

class UPIpayment implements Payment{

	@Override
	public void pay(double amount) {
		System.out.println("You payed amount of "+amount+ " through UPIPayment");
		
	}
	
}
public class PaymentSystem {
	
	public static void main(String[] args) {
		Cardpayment card = new Cardpayment();
		card.pay(1000);
		
		UPIpayment upi =new UPIpayment();
		upi.pay(2000);
		
	}

}
