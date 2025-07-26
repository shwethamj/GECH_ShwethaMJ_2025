package com.example.DBRelationEmployee.service;


import com.example.DBRelationEmployee.DTO.AddressDTO;
import com.example.DBRelationEmployee.model.Address;
import com.example.DBRelationEmployee.repository.AddressRepository;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressService {

	
    private final AddressRepository addressRepository;

    public AddressService(AddressRepository addressRepository) {
        this.addressRepository = addressRepository;
    }

    public void saveAddress(@Valid AddressDTO addressDTO) {
        Address address = new Address();
        address.setAddress(addressDTO.getAddress());
        addressRepository.save(address);
    }

    public void updateAddress(@Valid AddressDTO addressDTO, Long id) {
        Address address = addressRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Address not found with ID: " + id));
        address.setAddress(addressDTO.getAddress());
        addressRepository.save(address);
    }

    public void deleteAddress(Long id) {
        Address address = addressRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Address not found with ID: " + id));

        // Optional: Unlink from employee if bi-directionally mapped
        if (address.getEmployee() != null) {
            address.getEmployee().setAddress(null);
        }

        addressRepository.delete(address);
    }
}
