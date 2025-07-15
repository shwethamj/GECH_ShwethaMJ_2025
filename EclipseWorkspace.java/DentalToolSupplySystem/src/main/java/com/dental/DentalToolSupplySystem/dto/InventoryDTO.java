package com.dental.DentalToolSupplySystem.dto;

public class InventoryDTO {

	private String name;
	private String price;
	private String quantity;
	
	//getters and setters
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	
	//tostring
	
	@Override
	public String toString() {
		return "InventoryDTO [name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
}
