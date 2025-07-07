package com.dental.DentalToolSupplySystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dental.DentalToolSupplySystem.dto.DentalToolDTO;
import com.dental.DentalToolSupplySystem.dto.InventoryDTO;
import com.dental.DentalToolSupplySystem.model.DentalTool;
import com.dental.DentalToolSupplySystem.model.Inventory;
import com.dental.DentalToolSupplySystem.repository.DentalToolRepository;
import com.dental.DentalToolSupplySystem.repository.InventoryRepository;

@Service
public class InventoryService {

	private DentalToolRepository dentalRepository;
	private InventoryRepository inventoryRepository;

	
	public InventoryService(DentalToolRepository dentalRepository, InventoryRepository inventoryRepository) {
		super();
		this.dentalRepository = dentalRepository;
		this.inventoryRepository = inventoryRepository;
	}

	public List<Inventory> getAllinventory() {
		List<Inventory> inventory =  inventoryRepository.findAll();
		return inventory;
	}
	
	public void saveInventory(InventoryDTO inventoryDTO) {
		
		Inventory inventory = new Inventory();
		inventory.setName(inventoryDTO.getName());
		inventory.setPrice(inventoryDTO.getPrice());
		inventory.setQuantity(inventoryDTO.getQuantity());

		inventoryRepository.save(inventory);
	}
	
	public void deleteInventory(Long id) {
		Inventory inventory =  inventoryRepository.findById(id).get();
		//what is the image path of the student
		inventoryRepository.delete(inventory);
	}
	
	public InventoryDTO editInventory(Long id) {
		Inventory inventory =  inventoryRepository.findById(id).get();
		InventoryDTO inventoryDTO = new InventoryDTO();
		inventoryDTO.setName(inventory.getName());
		inventoryDTO.setPrice(inventory.getPrice());
		inventoryDTO.setQuantity(inventory.getQuantity());
		
		return inventoryDTO;
	}

	public void updateInventory(InventoryDTO inventoryDTO, Long id) {
		Inventory inventory =  inventoryRepository.findById(id).get();
		inventoryDTO.setName(inventory.getName());
		inventoryDTO.setPrice(inventory.getPrice());
		inventoryDTO.setQuantity(inventory.getQuantity());
		
		inventoryRepository.save(inventory);
	}

}
