package com.dental.DentalToolSupplySystem.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="ActiveLog")

public class ActivityLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private DentalTool user;

    @ManyToOne
    private Inventory inventory;

    private LocalDateTime purchaseDate;

	public ActivityLog(Long id, DentalTool user, Inventory inventory, LocalDateTime purchaseDate) {
		super();
		this.id = id;
		this.user = user;
		this.inventory = inventory;
		this.purchaseDate = purchaseDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public DentalTool getUser() {
		return user;
	}

	public void setUser(DentalTool user) {
		this.user = user;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public LocalDateTime getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(LocalDateTime purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	@Override
	public String toString() {
		return "ActivityLog [id=" + id + ", user=" + user + ", inventory=" + inventory + ", purchaseDate="
				+ purchaseDate + "]";
	}

	public ActivityLog() {
		super();
	}
    
}
