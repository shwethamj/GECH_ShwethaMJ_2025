package com.dental.DentalToolSupplySystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dental.DentalToolSupplySystem.model.DentalTool;

public interface UserRepository extends JpaRepository<DentalTool, Long> {
	public DentalTool findByEmail(String email);

	List<DentalTool> findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(String name, String email);


}
