package com.example.DBRelationEmployee.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.DBRelationEmployee.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long> {

	
	Optional<Address> findByAddress(String address);

	

	

}
