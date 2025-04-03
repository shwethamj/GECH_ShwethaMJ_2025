package oops;

class BankAccount{
	private int account_number;
	private String account_holder;
	private double balance;
	
	
	//getters and setters
	public int getAccount_number() {
		return account_number;
	}

	public void setAccount_number(int account_number) {
		this.account_number = account_number;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	//constructor -- to give  all values in object like (4,"shwe",3400)

	public BankAccount(int account_number, String account_holder, double balance) {
		super();
		this.account_number = account_number;
		this.account_holder = account_holder;
		this.balance = balance;
	}
	
	

	public void deposite(double amount) {
		if(amount>0) {
			balance += amount;
			System.out.println("the deposited amount:"+amount+" Available balance is:"+balance);
		}
		else {
			System.out.println("deposited amount must be positive");
		}

	}
	
	//ToString to directly call the object
	@Override
	public String toString() {
		return "BankAccount [account_number=" + account_number + ", account_holder=" + account_holder + ", balance="
				+ balance + "]";
	}

	public void withdraw(double amount) {
		if(amount>0 && amount<=balance) {
			balance -= amount;
			System.out.println("the deposited amount:"+amount+"\n Availablebalance is:"+balance);
		}
		else {
			System.out.println("balance should be greater than zero");
		}
	}
}


public class Assignment1 {

	public static void main(String[] args) {
		
		BankAccount bankaccount = new BankAccount(20000,"shwetha",10000);
		bankaccount.deposite(5000);
		bankaccount.withdraw(1000);
		System.out.println(bankaccount);
		
		

	}

}
