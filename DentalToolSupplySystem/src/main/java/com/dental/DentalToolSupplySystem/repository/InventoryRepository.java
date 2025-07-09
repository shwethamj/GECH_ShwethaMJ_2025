package com.dental.DentalToolSupplySystem.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.model.Inventory;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {
	Optional<Inventory> findById(Long id);

	List<Inventory> findByNameContainingIgnoreCaseOrPriceContainingIgnoreCase(String name, String price);


}
