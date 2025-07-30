package oopsAssignment;

//ENCAPSULATION
class BankAccount{
	private String accountnumber;
	private String accountHoldername;
	private double balance;
	
	//getter and setter
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getAccountHoldername() {
		return accountHoldername;
	}
	public void setAccountHoldername(String accountHoldername) {
		this.accountHoldername = accountHoldername;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	
	public void deposite(double amount) {
		if(amount <=0) {
			System.out.println("enter a valid amount");
		}
		else {
			balance += amount;
			System.out.println("deposit of an amount : "+amount+" is successed");
			System.out.println("Available balance after deposite : "+balance +"\n");
		}
	}
	
	public void withdraw(double amount) {
		if(amount<=0) {
			System.out.println("enter valid amount");
		}
		else if(amount > balance) {
			System.out.println("For Withdraw Insufficient Balance in your account\n ");
		}
		else {
			balance -=amount;
			System.out.println("You withdrawed the amount : "+amount);
			System.out.println("Available balance after withdraw : "+balance +"\n");
		}
	}
	
	public void checkBalance() {
		System.out.println("The available balance is : "+this.balance +"\n");
	}
	
}
public class BankAccountSystem {

	public static void main(String[] args) {
		BankAccount bank = new BankAccount();
		
		bank.setAccountHoldername("Shwetha");
		bank.setAccountnumber("12345");
		bank.setBalance(3000);
		
		System.out.println("account holder name is : "+bank.getAccountHoldername()+"\n");
		
		bank.deposite(5000);
		
		bank.withdraw(100000);
		
		bank.withdraw(2000);
		bank.getBalance();
	}
}
