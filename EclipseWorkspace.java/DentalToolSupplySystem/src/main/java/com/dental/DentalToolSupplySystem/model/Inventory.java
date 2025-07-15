package com.dental.DentalToolSupplySystem.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name ="Inventory")

public class Inventory {
			@Id
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private long id;
			private String name;
			private String price;
			private String quantity;
			
			
			public Inventory() {
				super();
			}


			public Inventory(long id, String name, String price, String quantity) {
				super();
				this.id = id;
				this.name = name;
				this.price = price;
				this.quantity = quantity;
			}


			public long getId() {
				return id;
			}


			public void setId(long id) {
				this.id = id;
			}


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


			@Override
			public String toString() {
				return "Inventory [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + "]";
			}
			
			
			
}
