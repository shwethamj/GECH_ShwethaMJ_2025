package oopsAssignment;

class Product{
	String name;
	double price;
	int quantity;
	//one parameter
	public Product(String name) {
		super();
		this.name = name;
	}
	
	//2parameter
	public Product(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	
	//3parameter
	public Product(String name, double price, int quantity) {
		super();
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	public void print() {
		System.out.println("the product name : "+name+ " has a price of "+price +"  and quantity is "+quantity);

	}
}
public class ConstructorOverloading {

	public static void main(String[] args) {
		Product p = new Product("T-shirt",1000,5);
		p.print();
		
		Product p1 = new Product("shirt",3000);
		p1.print();
		
		Product p2 = new Product("Dress");
		p2.print();
		
	}
}
