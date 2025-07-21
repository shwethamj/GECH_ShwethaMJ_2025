package com.example.DBRelationEmployee.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DBRelationEmployee.model.Address;


@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {

	Optional<Address> findByAddress(String address);

}
