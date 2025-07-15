package com.example.DBRelationEmployee.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DBRelationEmployee.DTO.AddressDTO;
import com.example.DBRelationEmployee.model.Address;
import com.example.DBRelationEmployee.repository.AddressRepository;
import com.example.DBRelationEmployee.service.AddressService;

import jakarta.validation.Valid;

@Controller
public class AddressController {

    private final AddressRepository addressRepository;
    private final AddressService addressService;

    public AddressController(AddressRepository addressRepository, AddressService addressService) {
        this.addressRepository = addressRepository;
        this.addressService = addressService;
    }

    @GetMapping("/addresses")
    public String listAddresses(Model model) {
        List<Address> addresses = addressRepository.findAll();
        model.addAttribute("addresses", addresses);
        return "addresses"; // View: addresses.html
    }

    @GetMapping("/add-address")
    public String addAddressForm(Model model) {
        model.addAttribute("addressDTO", new AddressDTO());
        return "add-address"; // View: add-address.html
    }

    @PostMapping("/add-address")
    public String saveAddress(@Valid @ModelAttribute AddressDTO addressDTO,
                              BindingResult result,
                              RedirectAttributes attributes) {

        Optional<Address> existing = addressRepository.findByAddress(addressDTO.getAddress().trim());
        if (existing.isPresent()) {
            result.addError(new FieldError("addressDTO", "address", "Address already exists"));
        }

        if (result.hasErrors()) {
            return "add-address";
        }

        addressService.saveAddress(addressDTO);
        attributes.addFlashAttribute("success", "Address added successfully.");
        return "redirect:/addresses";
    }

    @GetMapping("/edit-address/{id}")
    public String editAddressForm(@PathVariable Long id, Model model, RedirectAttributes attributes) {
        Optional<Address> address = addressRepository.findById(id);
        if (address.isEmpty()) {
            attributes.addFlashAttribute("error", "Address not found.");
            return "redirect:/addresses";
        }

        AddressDTO dto = new AddressDTO();
        dto.setAddress(address.get().getAddress());

        model.addAttribute("address", address.get());
        model.addAttribute("addressDTO", dto);
        return "edit-address"; // View: edit-address.html
    }

    @PostMapping("/edit-address/{id}")
    public String updateAddress(@PathVariable Long id,
                                @Valid @ModelAttribute AddressDTO addressDTO,
                                BindingResult result,
                                RedirectAttributes attributes,
                                Model model) {

    	Optional<Address> duplicate = addressRepository.findByAddress(addressDTO.getAddress().trim());
    	if (duplicate.isPresent() && !Long.valueOf(duplicate.get().getId()).equals(id)) {
    	    result.addError(new FieldError("addressDTO", "address", "Address already exists."));
    	}

        if (result.hasErrors()) {
            model.addAttribute("address", addressRepository.findById(id).orElse(null));
            return "edit-address";
        }

        addressService.updateAddress(addressDTO, id);
        attributes.addFlashAttribute("success", "Address updated successfully.");
        return "redirect:/addresses";
    }

    @GetMapping("/delete-address/{id}")
    public String deleteAddress(@PathVariable Long id, RedirectAttributes attributes) {
        if (addressRepository.existsById(id)) {
            addressService.deleteAddress(id);
            attributes.addFlashAttribute("success", "Address deleted successfully.");
        } else {
            attributes.addFlashAttribute("error", "Address not found.");
        }
        return "redirect:/addresses";
    }
    
}