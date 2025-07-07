package com.dental.DentalToolSupplySystem.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.model.Inventory;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {
	public Inventory findById(long id);

	

}
