package com.dental.DentalToolSupplySystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dental.DentalToolSupplySystem.model.ActivityLog;


	public interface ActivityLogRepository extends JpaRepository<ActivityLog, Long> {
	    List<ActivityLog> findTop10ByOrderByPurchaseDateDesc();
	}


