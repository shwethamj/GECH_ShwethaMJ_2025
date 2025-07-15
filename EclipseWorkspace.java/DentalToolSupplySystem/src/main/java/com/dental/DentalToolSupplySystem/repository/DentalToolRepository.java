package com.dental.DentalToolSupplySystem.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dental.DentalToolSupplySystem.model.DentalTool;

	@Repository
	public interface  DentalToolRepository extends JpaRepository<DentalTool, Long> {
		Optional<DentalTool> findByEmail(String email);
		
		 
	}

