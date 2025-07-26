package com.dental.DentalToolSupplySystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dental.DentalToolSupplySystem.model.ActivityLog;
import com.dental.DentalToolSupplySystem.repository.ActivityLogRepository;
import com.dental.DentalToolSupplySystem.repository.InventoryRepository;
import com.dental.DentalToolSupplySystem.repository.UserRepository;

import jakarta.websocket.server.ServerEndpoint;

@Service
public class ActivityLogService {

	
	 @Autowired
	    private UserRepository userRepository;

	    @Autowired
	    private InventoryRepository  inventoryRepository;

	    @Autowired
	    private ActivityLogRepository activityLogRepository;

	    public long countTotalUsers() {
	        return userRepository.count();
	    }

	    public long countTotalInventoryItems() {
	        return inventoryRepository.count();
	    }

	    public long countTotalCategories() {
	        // If categories are part of another table, adjust this accordingly
	        return 5; // Example hardcoded
	    }

	    public List<ActivityLog> getRecentActivityLogs() {
	        return activityLogRepository.findTop10ByOrderByPurchaseDateDesc(); // Recent 10
	    }
}
